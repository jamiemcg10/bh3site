require 'open-uri'

class StaticController < ApplicationController
  CAL_URL = 'https://www.googleapis.com/calendar/v3/calendars/bostonhash@gmail.com/events?futureevents=true&orderby=starttime&sortorder=a&singleevents=true&showDelete=false&singleEvents=true&orderBy=startTime&timeMin='

  CLIENT_API_KEY = ENV['GOOGLE_CLIENT_API_KEY']
  SERVER_API_KEY = ENV['GOOGLE_SERVER_API_KEY']


  def welcome
    @api_key =  CLIENT_API_KEY
    @next_hash = get_next_hash(id)
  end
  
  def more
  end
  
  def about
  end
  
  def calendar
    @api_key =  CLIENT_API_KEY 
  end
  
  private 

  def id
    params[:id].to_i ||= 0
  end

  def get_next_hash(id)
      
      url = calendar_url
      cal_results = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
      ev = JSON.parse(cal_results)['items'][id]
      next_ev = Event.new ev

      # From best I can tell this is a google cal api bug, we're occasionally getting an item from the previous day when we should not.
      # Typically this isn't a big deal and sorts itself in a day or so.  But when we have lots of events in a short span - ie marathon week - this is problematic
      # In fairness to them I think this feed we use is some kind of forgotten back door
      if id == 0 and next_ev.when < Time.zone.now.beginning_of_day then
        ev = JSON.parse(cal_results)['items'][id + 1]
        next_ev = Event.new ev
      end
      return next_ev
  rescue Exception => e
      puts e
  end

  private
  
  def calendar_url
    @cal_url = CAL_URL + Time.zone.now.beginning_of_day.iso8601
    @cal_url << '&key=' + SERVER_API_KEY
    return @cal_url
  end
end
