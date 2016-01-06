class EventRegistrationsController < ApplicationController
  def new
    @event = event
    @event_registration = event.event_registrations.build
  end

  def create
    rego = event.event_registrations.create
    rego.update_attributes(rego_params[:event_registration])
  end

  private

  def event
    SpecialEvent.find_by(params[:special_event_id])
  end

  def rego_params
    params.permit(event_registration: [:email, :hash_name, :nerd_name, :kennel, :food_preference, :gluten_allergy, :need_crash_space])
  end
end
