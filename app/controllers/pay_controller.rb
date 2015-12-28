include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

class PayController < ApplicationController
	
	# this guy will catch the paypal webhooks
	def catch
		 r = request.body.read
		 log(r)
		 render :text => r
		 puts r

		 ppdata = JSON.parse r

		 puts ppdata.resource.amount.total
	end


end