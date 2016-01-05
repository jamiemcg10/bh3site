class EventRegistrationsController < ApplicationController
  def new
    @event_registration = EventRegistration.new
  end

  def create
    EventRegistration.create(registration_params[:event_registration])
  end

  private

  def registration_params
    params.permit(event_registration: [:hash_name, :email])
  end
end
