Rails.application.routes.draw do
  # Define routes for categories
  resources :categories

  # Define routes for products
  resources :products do
    post 'add_to_cart', to: 'carts#add_to_cart', on: :member
    collection do
      get 'on_sale', to: 'products#_product_on_sale'
      get 'new_products', to: 'products#_product_new'
      get 'recently_updated_products', to: 'products#_product_recently_updated'
    end
  end

  root 'home#index'

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :products, only: [:create, :destroy]
  end

  resource :cart, only: [:show, :update, :destroy] do
    member do
      delete 'remove_item/:id', to: 'carts#remove_item', as: 'remove_item'
    end
  end

  

  # Route for adding a product to the cart (if not using the resourceful route above)
  # post 'products/:id/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
