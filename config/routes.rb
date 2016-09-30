Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get '/restaurant', controller: :restaurants, action: :index

  resources :menus, only: [:index, :create, :new, :show]
  resources :dishes, only: [:new, :show, :create]

  root to: 'restaurant#index'
end
