require 'rss'
require 'open-uri'

class HomeController < ActionController::Base
  layout 'application'
  def index
    # cache is nil if not set or if expired
    # rave_status expires after 5 minutes, goes back to off by default
    @status = Rails.cache.read("rave_status").nil? ? "off" : Rails.cache.read("rave_status")
    @notification_status = Rails.cache.read('rave_notification_status').nil? ? "off" : Rails.cache.read("rave_notification_status")
  end

  def toggle_alert
    status = request[:status] == "on" ? "off" : "on"

    Rails.cache.write("rave_status", status, expires_in: 5.minutes)
    redirect_to action: 'index'
  end

  def toggle_notification
    notification_status = request[:notification_status] == "on" ? "off" : "on"

    Rails.cache.write("rave_notification_status", notification_status, expires_in: 5.minutes)
    redirect_to action: 'index'
  end
end
