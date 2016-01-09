class EventRegistrationsController < ApplicationController
  def new
    @event = event
    @event_registration = event.event_registrations.build
  end

  def create
    rego = event.event_registrations.build
    if rego.update_attributes(update_params)
      return_url = "#{request.protocol}#{request.host_with_port}/paypal/success/#{event.url_code}";
      redirect_to controller: 'pay', action: 'index', price: price, event_name: "#{event.url_code}",rego_id:"#{rego.id}", return_url: return_url 
    else
      flash[:failure] = "Please fill out all required fields. Any field marked with * is required!"
      redirect_to new_special_event_event_registration_path(event)
    end
  end

  private

  def event
    SpecialEvent.find_by_id(params[:special_event_id])
  end

  def update_params
    rego_params[:event_registration].merge(rego_price: price)
  end

  def rego_params
    params.permit(event_registration: [:contact_email, :hash_name, :nerd_name, :kennel, :food_preference, :gluten_allergy, :need_crash_space, :extra_hab, :extra_hab_size, :payment_email])
  end

  def price
    "00.02"
  end
end
