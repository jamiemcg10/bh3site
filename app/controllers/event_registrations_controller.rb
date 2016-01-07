class EventRegistrationsController < ApplicationController
  def new
    @event = event
    @event_registration = event.event_registrations.build
  end

  def create
    rego = event.event_registrations.build
    if rego.update_attributes(rego_params[:event_registration])
      flash[:notice] = "You're registered for BH3 Marathon 2016!"
    else
      flash[:notice] = "Sorry, something went wrong."
    end
    redirect_to "/events/#{event.url_code}"
  end

  private

  def event
    SpecialEvent.find_by(params[:special_event_id])
  end

  def rego_params
    params.permit(event_registration: [:contact_email, :hash_name, :nerd_name, :kennel, :food_preference, :gluten_allergy, :need_crash_space, :extra_hab, :extra_hab_size, :payment_email])
  end
end
