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
        xml.title "ALERT: There is an emergency."
        xml.description "ALERT: There is currently an emergency at Chapman University."
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