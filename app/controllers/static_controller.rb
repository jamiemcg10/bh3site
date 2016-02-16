require "open-uri"

class StaticController < ApplicationController
  CAL_URL = "https://www.googleapis.com/calendar/v3/calendars/bostonhash@gmail.com/events?key=AIzaSyCMZCb6nbsoAyOwuBDD2pRrvMf1rjYSANc&futureevents=true&orderby=starttime&sortorder=a&singleevents=true&showDelete=false&singleEvents=true&orderBy=startTime&timeMin="

  def welcome
    @next_hash = get_next_hash(id)
  end
  
  def more
  end
  
  def about
  end
  
  def calendar
  end
  
  private 

  def id
    params[:id].to_i ||= 0
  end

  def get_next_hash(id)
      url = CAL_URL + Time.zone.now.beginning_of_day.iso8601
      cal_results = open(url).read
      ev = JSON.parse(cal_results)["items"][id]
      Event.new ev
  rescue Exception => e
      puts e
  end
end
