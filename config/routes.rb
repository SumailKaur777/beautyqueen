Rails.application.routes.draw do
  # Define routes for categories
  resources :categories, only: [:show]

  # Define routes for products
  resources :products

  # Set root path
  root 'products#index'

  # Define routes for Devise users
  devise_for :users

  # Define routes for ActiveAdmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define routes for admin namespace
  namespace :admin do
    resources :products, only: [:create, :update]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
