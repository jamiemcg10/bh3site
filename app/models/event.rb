require 'nokogiri'

# Represents a Google Calendar Event.
class Event 
  
  def initialize raw_xml
    # parse the event xml out into it's relevent parts
    doc = Nokogiri::XML(raw_xml)
    @gid = doc.xpath("//id").inner_text

    @summary = doc.xpath("//summary").inner_text
    @where = parse_where(@summary)
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
    @title = doc.xpath("//title").inner_text
    @desc = doc.xpath("//content").inner_text
    @when = parse_when(@summary)
  end
  
  def title
    @title
  end
  
  def description
    # remove everything before 'Event Description: '
    @desc.sub(/^.*Event Description: /m,'')
  end
  
  def when
    @when
  end
  
  def where
    @where
  end
  
  def latitude
    @hashevent.latitude
  end
  
  def longitude
    @hashevent.longitude
  end
  
  private 
    def parse_when(summary)
      # this is a bit ugly but will parse the start time from the summary string as not every event includes start-time
      when_string = summary.match(/When:.*to/)
      if when_string then
        date_string = summary.match(/When:.*to/)[0].sub('When: ','').sub(' to','')
        @when = date_string.to_datetime
      else
        @when = DateTime.now
      end
    end
    
    def parse_where(summary)
      # see above ugly comment
      location_match = summary.match(/Where:.*/)
      if location_match then
        @where = location_match[0].sub('Where: ','')
        # people put annoying things in the Where field, like TBD
        if @where.downcase.strip.casecmp("tbd") == 0 then @where = 'Boston, MA' end
        return @where
      else
        @where = 'Boston, MA'
        return @where
      end
    end
  
end