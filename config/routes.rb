Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :menu, only: [:index, :create, :new]
  resources :dishes, only: [:new, :show, :create] do
    post 'add_item', controller: :carts, action: :add_item
  end

  get '/menu', controller: :menu, action: :index
end
