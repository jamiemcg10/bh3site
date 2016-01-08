class EventRegistrationsController < ApplicationController
  def new
    @event = event
    @event_registration = event.event_registrations.build
  end

  def create
    rego = event.event_registrations.build
    if rego.update_attributes(rego_params[:event_registration])
      flash[:notice] = "You're registered for BH3 Marathon 2016!"
      return_url = "#{request.protocol}#{request.host_with_port}/paypal/success/#{event.url_code}";
      redirect_to controller: 'pay', action: 'index', price: '00.02', event_name: "#{event.url_code}", return_url: return_url 
    else
      flash[:failure] = "Please fill out all required fields marked by *!"
      redirect_to new_special_event_event_registration_path(event)
    end
  end

  private

  def event
    SpecialEvent.find_by_id(params[:special_event_id])
  end

  def rego_params
    params.permit(event_registration: [:contact_email, :hash_name, :nerd_name, :kennel, :food_preference, :gluten_allergy, :need_crash_space, :extra_hab, :extra_hab_size, :payment_email])
  end
end
