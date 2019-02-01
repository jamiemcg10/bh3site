require "uri"
require "net/http"

class PayController < ApplicationController
	protect_from_forgery except: [:catch]

  def index
    #NOTE: HTTPS is necessary for using PayPal IPN, which means using the Heroku URLs
    notify_url = request.host.include?("bostonhash.com") ? "https://bh3prod.herokuapp.com/paypal" : "https://bh3demo.herokuapp.com/paypal"
    redirect_to paypal_url(index_params[:price], index_params[:event_name], index_params[:rego_id], index_params[:return_url], notify_url)
  end

  def catch
    payment_status = catch_params[:payment_status]
    payer_email =  catch_params[:payer_email]
    txn_id = catch_params[:txn_id]
    amount = catch_params[:mc_gross]
    url_code = catch_params[:item_name]
    rego_id = catch_params[:item_number]
    txn = Hash["payer" => payer_email, "rego_id" => rego_id, "txn_id" => txn_id, "amount" => amount, "status" => payment_status, "event" => url_code]

    raise "IPN not validated" unless validate_ipn(request.raw_post) == true

    mark_rego_as_paid(rego_id) if payment_status == "Completed"

    render text: params
  end
 
  def success
  end

  private

  def index_params
    params.permit(:event_name, :price, :rego_id, :return_url)
  end

  def catch_params
    params.permit(:payment_status, :payer_email, :txn_id, :mc_gross, :item_name, :item_number)
  end

  def mark_rego_as_paid(rego_id)
    rego = EventRegistration.find_by id: rego_id.to_i
    rego.update_attributes(paid: true)
  rescue NoMethodError
    puts "IPN error for rego id: #{rego_id}"
    raise ActiveRecord::RecordNotFound
  end

  def paypal_url(price, event_name, rego_id, return_url, notify_url)
    values = {
      business: "#{Figaro.env.paypal_email}",
      cmd: "_xclick",
      upload: 1,
      return: return_url,
      amount: price,
      item_name: event_name,
      item_number: rego_id,
      quantity: '1',
      rm: '0',
      cbt: 'Back to Boston Hash House Harriers',
      notify_url: notify_url
    }
    
    "#{Figaro.env.paypal_endpoint}" + values.to_query
  end

  # take raw ipn and validate it
  def validate_ipn(raw)
    post_data = "cmd=_notify-validate&" + raw
    url = URI.parse(Figaro.env.ipn_validate_endpoint)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.path)
    request.body = post_data

    response = http.request(request)
    body = response.body()
    http_status = response.code

    return http_status == "200" && body == "VERIFIED"
  end
end
