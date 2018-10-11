# basic format copied from http://www.getrave.com/rss/chapman/channel1
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Chapman Homepage PANTHER NOTICE"
    xml.description "When this feed it used, it will push NOTICES to the top of the homepage. This is not for ALERTS which are designed to display differently on the homepage"
    xml.link "http://www.getrave.com/rss/chapman/channel3"
    xml.category "Panther Alerts"

    xml.image do
      xml.title "Chapman Panther Alerts"
      xml.url "http://www.chapman.edu/campus-services/public-safety/_files/Panther%20Alert%20Logo-Web.jpg"
      xml.link "http://www.getrave.com/rss/chapman/channel3"
    end

    xml.item do
      if @notification_status == "on"
        # The emergency panther alert format comes from a test alert published by Public Safety on 10/19/2017
        xml.title "Panther Notification Test #{@notification_status}"
        xml.description "This is a Panther Notification Test. Please note that palm ave. will be closed between the hours of 12pm and 8pm"
      else
        xml.title "There is currently no notification"
        xml.description "There is currently no notifications for Chapman University."
      end

      xml.category "Panther Notification"
      xml.pubDate Time.zone.now.strftime("%m/%d/%Y%l:%M%p")
      xml.guid
      xml.link
    end
  end
end