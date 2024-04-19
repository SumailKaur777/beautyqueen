# app/controllers/admin_dashboard_controller.rb

class AdminDashboardController < ApplicationController
    before_action :authenticate_admin_user!
  
    def index
      # Your admin dashboard logic here
    end
  end
  