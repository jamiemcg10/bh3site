class SpecialEventsController < ApplicationController
  def index
    upcoming_events = SpecialEvent.where("date >= ?", Date.today)
    @events = upcoming_events.order(date: :asc)
  end

  def show
    @event = find_event_by_url_code
  end

  def rego
    @event = find_event_by_url_code
  end

  private

  def find_event_by_url_code
    SpecialEvent.find_by!(url_code: params[:url_code])
  end
end
