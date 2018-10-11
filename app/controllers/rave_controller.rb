class RaveController < ActionController::Base
  layout 'application'
  def index
    @status = Rails.cache.read("rave_status")

    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  def notification
    @notification_status = Rails.cache.read("rave_notification_status")

    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
