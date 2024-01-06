# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
  
    private
  
    def find_user
      @user = User.find_by(ip_address: request.remote_ip)
    end
  end
  