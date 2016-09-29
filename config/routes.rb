Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :dishes, only: [:new, :show, :create]

  get '/menu', controller: :menu, action: :index

  get '/cart', controller: :cart, action: :index 

end
