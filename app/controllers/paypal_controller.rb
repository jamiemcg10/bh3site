include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

class PayPalController < ApplicationController
	
	# this guy will catch the paypal webhooks
	def catch
		 r = request.body.read
		 log(r)
		 render :text => r
	end


	private

		# little bit of validation to make sure it's actually paypal posting to us and not some jabroni 
		def validate
		end
end