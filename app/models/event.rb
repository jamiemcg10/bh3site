require 'nokogiri'

# Represents a Google Calendar Event.
class Event 
  
  def initialize raw_xml
    # parse the event xml out into it's relevent parts
    doc = Nokogiri::XML(raw_xml)
    @title = doc.xpath("//title").inner_text
    @desc = doc.xpath("//content").inner_text
    @summary = doc.xpath("//summary").inner_text
    @where = parse_where(@summary)
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
  
  private 
    def parse_when(summary)
      # this is a bit ugly but will parse the start time from the summary string as not every event includes start-time
      date_string = summary.match(/When:.*to/)[0].sub('When: ','').sub(' to','')
      @when = date_string.to_datetime
    end
    
    def parse_where(summary)
      # see above ugly comment
      location_match = summary.match(/Where:.*/)
      if location_match then
        @where = location_match[0].sub('Where: ','') 
      else
        @where = 'Boston, MA'
      end
    end
  
end