# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :find_or_create_user

  private

  def find_or_create_user
    @user = User.find_or_create_by(ip_address: request.remote_ip)
  end
end
