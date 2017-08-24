require 'rss'
require 'open-uri'

class HomeController < ActionController::Base
  layout 'application'

  def index
    @status = Rails.cache.read("rave_status")
  end

  def send_alert
    if request[:status] == "on"
      status = "off"
    else
      status = "on"
    end

    Rails.cache.write("rave_status", status)
    redirect_to :action => 'index'
  end

  def live_feed
    url = "http://www.getrave.com/rss/chapman/channel1"
    open(url) do |rss|
      feed = RSS::Parser.parse(rss, do_validate=false)
    end
  end 
end