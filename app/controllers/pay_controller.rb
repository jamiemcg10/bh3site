require "uri"
require "net/http"

class PayController < ApplicationController
	protect_from_forgery except: [:catch]

	IPN_VALIDATE_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr"
	PAY_CONFIRM_URL = "http://google.com"
	PAY_EMAIL = "brendan.caffrey@gmail.com"

	# this guy will catch the paypal ipn
	def catch
		  params.permit! # Permit all Paypal input params
		  pp_status = params[:payment_status]
		  raw = request.raw_post
		  validate raw
		  if pp_status == "Completed"
		  	  payer =  params[:payer_email]
		  	  txn_id = params[:txn_id]
		  	  amount = params[:mc_gross]
		  	  txn = Hash["payer" => payer, "txn_id" => txn_id, "amount" => amount] 
		  	  puts txn
		  end
		
		  render :text => params
	end

	# this guy will redirect the user to paypal to get their $$
	def index 
		id = params["id"]
		price = params["price"]
		event_name = params["event_name"]
		event_id = params["event_id"]
		redirect_to paypal_url(id,price,event_name,event_id)
	end

 private 
	 def paypal_url(id,price,event_name,event_id)
	    values = {
	        business: "#{PAY_EMAIL}",
	        cmd: "_xclick",
	        upload: 1,
	        return: "#{PAY_CONFIRM_URL}",
	        invoice: id,
	        amount: price,
	        item_name: event_name,
	        item_number: event_id,
	        quantity: '1',
	        notify_url: 'https://bh3demo.herokuapp.com/paypal' # TODO:  set this to our paypal controller url - this will cause the IPN to callback to us
	    }
	    "https://sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	  end

	  # take raw ipn and validate it
	  def validate_ipn(raw)
	  	post_data = "cmd=_notify-validate&" + raw
	  	url = URI.parse(IPN_VALIDATE_URL)
	  	http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true

		request = Net::HTTP::Post.new(uri.path)
		request.body = post_data

		response = http.request(request)
		puts response
	  end
	  	
	  


end