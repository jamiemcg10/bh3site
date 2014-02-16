require "spec_helper"
require 'date'

describe Event do
  
  VALID_XML = "<entry>
    <id>http://www.google.com/calendar/feeds/bostonhash%40gmail.com/public/basic/o72mat6sjoi6khhgeddoc7h5jo</id>
    <published>2013-04-30T20:38:32.000Z</published>
    <updated>2013-10-09T12:45:07.000Z</updated>
    <category scheme=\"http://schemas.google.com/g/2005#kind\" term=\"http://schemas.google.com/g/2005#event\"/>
    <title type=\"html\">Pink Taco Trail 19</title>
    <summary type=\"html\">When: Mon Oct 14, 2013 6:30pm to Mon Oct 14, 2013 9:30pm&amp;nbsp;
    EDT&lt;br&gt;
    &lt;br&gt;Who: Boston Hasher
    &lt;br&gt;Where: 2388 Massachusetts Avenue, Cambridge, MA, 02140
&lt;br&gt;Event Status: confirmed</summary>
    <content type=\"html\">When: Mon Oct 14, 2013 6:30pm to Mon Oct 14, 2013 9:30pm 
  EDT&lt;br /&gt;
  &lt;br /&gt;Who: Boston Hasher

  &lt;br /&gt;Event Status: confirmed
  &lt;br /&gt;Event Description: When: Oct 14th, 6:30HST 

  Where: Joe Sent Me, 2388 Massachusetts Avenue, Cambridge, MA, 02140 (Nearest T is Davis on the redline).  

  Hare: Spunk in the Trunk

  Sack Car: Yankee

  $5 Hash Cash

  Promises - shitty trail. Gracias. (Don&amp;#39;t forget cranium lamps ladies - it&amp;#39;s getting dark out there!)</content>
    <link rel=\"alternate\" type=\"text/html\" href=\"https://www.google.com/calendar/event?eid=bzcybWF0NnNqb2k2a2hoZ2VkZG9jN2g1am8gYm9zdG9uaGFzaEBt\" title=\"alternate\"/>
    <link rel=\"self\" type=\"application/atom+xml\" href=\"https://www.google.com/calendar/feeds/bostonhash%40gmail.com/public/basic/o72mat6sjoi6khhgeddoc7h5jo\"/>
    <author>
      <name>alicia.aci@gmail.com</name>
      <email>alicia.aci@gmail.com</email>
    </author>
  </entry>"
  
  describe  "new event with valid xml should return valid object" do
    event = Event.new(VALID_XML)
    
    it "returns an object when given valid xml" do
      event.should_not be_nil
    end
    
    it "has a correct title" do
       event.title.should == "Pink Taco Trail 19"
    end
    
    it "has a description" do
       event.description.length.should > 0
    end
    
    it "has a valid start date" do
      date = DateTime.new(2013, 10, 14, 18, 30)
      event.when.should == date
    end
    
    it "has a location" do
      event.where.should == "2388 Massachusetts Avenue, Cambridge, MA, 02140"
    end
  end
  
  describe "new event with no location should return a valid object" do
    xml = VALID_XML.sub(/Where: 2388 Massachusetts Avenue, Cambridge, MA, 02140/m,'')
    event = Event.new(xml)
    
    it "has a location" do
        event.where.should == "Boston, MA"
    end
    
  end
  
  describe "new event with nil when should return a valid object" do
    xml = VALID_XML.sub(/When/m,'')
    event = Event.new(xml)
    it "is a valid event object" do
      event.should_not be_nil
    end
  end
  
end