Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :dishes, only: [:new, :show, :create]
  resources :carts, only: [:index, :add_item]
  
  get '/menu', controller: :menu, action: :index
end
