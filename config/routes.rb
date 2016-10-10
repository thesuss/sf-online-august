Rails.application.routes.draw do

  resources :carts, only: [:index]
  post '/charges', controller: :carts, action: :create

  post '/checkout', controller: :carts, action: :checkout

  resources :restaurants, only: [:index, :new, :create, :show, :edit, :update]

  resources :dishes, only: [:new, :show, :create, :edit, :update] do
    post 'add_item', controller: :carts, action: :add_item
  end

  devise_for :users, controllers: { registrations: 'registrations'}

  resources :menus, only: [:index, :create, :new, :show, :edit, :update]

  root to: 'restaurants#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [:index]
    end
  end
end
