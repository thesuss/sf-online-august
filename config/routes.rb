Rails.application.routes.draw do

  resources :carts, only: [:index]
  post '/checkout', controller: :carts, action: :checkout

  resources :restaurants, only: [:index, :new, :create, :show]
  resources :dishes, only: [:new, :show, :create] do
    post 'add_item', controller: :carts, action: :add_item
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :menus, only: [:index, :create, :new, :show, :edit, :update]

  root to: 'restaurants#index'
end
