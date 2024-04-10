# app/helpers/application_helper.rb
module ApplicationHelper
    def current_user_admin?
      current_user && current_user.admin?
    end
  end
  