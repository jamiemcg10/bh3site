class EventRegistrationsController < ApplicationController
  def new
    @event = event
    @event_registration = event.event_registrations.build
  end

  def create
    EventRegistration.create(registration_params[:event_registration])
  end

  private

  def event
    SpecialEvent.find_by(params[:special_event_id])
  end

  def registration_params
    params.permit(event_registration: [:hash_name, :email])
  end
end
