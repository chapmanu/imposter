class PingController < ActionController::Base

  def index
    render json: {"data":"pong"}, status: 200
  end
end