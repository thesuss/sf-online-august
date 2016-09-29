Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :dishes, only: [:new, :show, :create] do
    post 'add_item', controller: :carts, action: :add_item
  end
  # resources :carts, only: [:index] do
  #   post 'add_item', controller: :cart, action: :add_item
  # end

  get '/menu', controller: :menu, action: :index
end
