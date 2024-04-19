class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :home_page?
    after_action :set_flash_message_for_authentication, unless: :devise_controller?
  
    private
  
    def home_page?
      params[:controller] == "home" && params[:action] == "index"
    end
  
    def set_flash_message_for_authentication
        if user_signed_in?
          flash[:notice] = "You have successfully signed in." unless flash.key?(:alert)
        elsif request.path != new_user_session_path && request.fullpath != destroy_user_session_path
          flash[:alert] = "You need to sign in or sign up before continuing." unless flash.key?(:notice)
        end
      end
    end      
  