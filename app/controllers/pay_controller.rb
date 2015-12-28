class PayController < ApplicationController
	
	PAY_CONFIRM_URL = "http://google.com"
	PAY_EMAIL = "brendan.caffrey@gmail.com"

	# this guy will catch the paypal webhooks
	def catch
		  params.permit! # Permit all Paypal input params
    	  status = params[:payment_status]
    	  if status == "Completed"
    	  		 r = request.body.read
				 log(r)
				 render :text => r
				 puts r
		  end
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
	        quantity: '1'
	    }
	    "https://sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	  end


end