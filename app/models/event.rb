

# Represents a Google Calendar Event.
class Event 
  
  def initialize event_hash
    @gid = event_hash["id"]

    @summary = event_hash["summary"]
    @where = event_hash["location"]
    @hashevent = HashEvent.find_by_google_id(@gid)

    if @hashevent == nil then
       @hashevent = HashEvent.new
       @hashevent.google_id = @gid
       @hashevent.location =  @where
       @hashevent.save
    else
      if @hashevent.location != @where then
        @hashevent.location =  @where
        @hashevent.save
      end
    end
    @title = event_hash["summary"]
    @desc = event_hash["description"]
    start = event_hash["start"] 
    if start.has_key?("dateTime") then
      @when = start["dateTime"].to_datetime 
    else
      @when = start["date"].to_datetime
    end
  end
  
  def title
    @title
  end
  
  def description
    # remove everything before 'Event Description: '
    @desc
  end
  
  def when
    @when
  end
  
  def where
    @where = (@where || "")
    if @where.downcase.strip.match(/^tbd/)  or @where.length == 0 then @where = 'Boston, MA United States' end
    @where
  end
  
  def latitude
    @hashevent.latitude
  end
  
  def longitude
    @hashevent.longitude
  end
  
  
end