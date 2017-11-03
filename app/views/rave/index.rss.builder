# basic format copied from http://www.getrave.com/rss/chapman/channel1
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Chapman Panther Alerts"
    xml.description "Welcome to Panther-Alert, Chapman University's Emergency Notification system.  Panther-Alert sends emergency messages to your mobile or fixed device of choice so you get emergency messages quickly wherever you are."
    xml.link "http://www.getrave.com/rss/chapman/channel1"
    xml.category "Panther Alerts"

    xml.image do
      xml.title "Chapman Panther Alerts"
      xml.url "http://www.chapman.edu/campus-services/public-safety/_files/Panther%20Alert%20Logo-Web.jpg"
      xml.link "http://www.getrave.com/rss/chapman/channel1"
    end

    xml.item do

      if @status == "on"
        # The emergency panther alert format comes from a test alert published by Public Safety on 10/19/2017
        xml.title "Panther Alert Test"
        xml.description "This is a Panther Alert Test as part of the Great California Shakeout Earthquake Exercise. Drop, Cover, and Hold On for 60 seconds. This is just a test."
      else
        xml.title "There is currently no emergency."
        xml.description "There is currently no emergency at Chapman University."
      end

      xml.category "Panther Alerts"
      xml.pubDate Time.zone.now.strftime("%m/%d/%Y%l:%M%p")
      xml.guid
      xml.link
    end
  end
end