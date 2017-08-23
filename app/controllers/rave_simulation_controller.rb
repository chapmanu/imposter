require 'rss'
require 'open-uri'

class RaveSimulationController < ActionController::Base
  layout 'application'

  def non_emergency_rss 
    RSS::Maker.make("atom") do |maker|
      maker.channel.author = "Public Safety"
      maker.channel.description = "Welcome to Panther-Alert, Chapman University's Emergency Notification system. Panther-Alert sends emergency messages to your mobile or fixed device of choice so you get emergency messages quickly wherever you are."
      maker.channel.updated = Time.now.to_s
      maker.channel.link = "http://www.getrave.com/rss/chapman/channel1"
      maker.channel.title = "Chapman Panther Alerts"
      maker.channel.id = 1

      maker.items.new_item do |item|
        item.title = "There is currently no emergency."
        item.description = "There is currently no emergency at Chapman University."
        item.updated = Time.now.to_s
        item.id = 1
      end
    end
  end

  def emergency_rss 
    RSS::Maker.make("atom") do |maker|
      maker.channel.author = "Public Safety"
      maker.channel.description = "Welcome to Panther-Alert, Chapman University's Emergency Notification system. Panther-Alert sends emergency messages to your mobile or fixed device of choice so you get emergency messages quickly wherever you are."
      maker.channel.updated = Time.now.to_s
      maker.channel.link = "http://www.getrave.com/rss/chapman/channel1"
      maker.channel.title = "Chapman Panther Alerts"
      maker.channel.id = 1

      maker.items.new_item do |item|
        item.title = "ALERT: There is an emergency."
        item.description = "ALERT: There is currently an emergency at Chapman University."
        item.updated = Time.now.to_s
        item.id = 1
      end
    end
  end

  def index
    @status = Rails.cache.read("rave_status")
    @live_rss = live_feed

    if @status == "on"
      @simulated_rss = emergency_rss
    else
      @simulated_rss = non_emergency_rss
    end
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