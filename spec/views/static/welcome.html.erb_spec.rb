require 'spec_helper'

  VALID_XML_FOR_VIEW = "<entry>
    <id>http://www.google.com/calendar/feeds/bostonhash%40gmail.com/public/basic/o72mat6sjoi6khhgeddoc7h5jo</id>
    <published>2013-04-30T20:38:32.000Z</published>
    <updated>2013-10-09T12:45:07.000Z</updated>
    <category scheme=\"http://schemas.google.com/g/2005#kind\" term=\"http://schemas.google.com/g/2005#event\"/>
    <title type=\"html\">Test Trail Name</title>
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

describe 'static/welcome.html.erb' do
  it 'displays next event title correctly' do
  	ev = Event.new(VALID_XML_FOR_VIEW)
    assign(:next_hash,ev)

    render
    rendered.should match(/Test Trail Name/)

  end

    it 'displays the map' do
  	ev = Event.new(VALID_XML_FOR_VIEW)
    assign(:next_hash,ev)

    render
    rendered.should have_selector("#map-canvas")

  end
  
  it 'converts urls to proper external links' do
  	ev = Event.new(VALID_XML_FOR_VIEW.sub(/5 Hash Cash/m,'5 Hash Cash http://google.com'))
    assign(:next_hash,ev)

    render
    puts rendered
    rendered.should have_selector("a[href='http://google.com'][target='_blank']")

  end


end