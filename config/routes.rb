Rails.application.routes.draw do
  get 'categories/show'
  devise_for :users
  get 'products/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
# config/routes.rb
resources :categories, only: [:show]

  # Defines the root path route ("/")
  # root "posts#index"
  #namespace :store do
  resources :products
  # config/routes.rb
  root 'home#index'
namespace :admin do
  resources :products, only: [:create, :update]
end


end
