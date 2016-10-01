Rails.application.routes.draw do

  get '/restaurant', controller: :restaurants, action: :index
  resources :carts, only: [:index]
  post '/checkout', controller: :carts, action: :checkout

  resources :dishes, only: [:new, :show, :create] do
    post 'add_item', controller: :carts, action: :add_item
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :menus, only: [:index, :create, :new, :show]

  root to: 'restaurants#index'
end
