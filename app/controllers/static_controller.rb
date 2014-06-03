require 'nokogiri'
require 'open-uri'

class StaticController < ApplicationController
  CALENDAR_FEED_URL = "https://www.google.com/calendar/feeds/bostonhash%40gmail.com/public/basic?futureevents=true&orderby=starttime&sortorder=a&singleevents=true"

  def welcome
    if !params[:id] then
      params[:id] = 0
    end
    @next_hash = get_next_hash(params[:id].to_f)
  end
  
  def more
  end
  
  def about
  end
  
  def calendar
  end
  
  def events
  end
  
  private 
    def get_next_hash(id)
        doc = Nokogiri::XML(open(CALENDAR_FEED_URL))
        events = doc.xpath("//xmlns:feed/xmlns:entry")
        if events.length == 0 then events = doc.xpath("//at:entry", {"at" => "http://www.w3.org/2005/Atom"}) end
        ev = events[id]
        event_xml = ev.to_s
        event_xml.sub! 'xmlns="http://www.w3.org/2005/Atom"',''
        Event.new event_xml
    end
end
