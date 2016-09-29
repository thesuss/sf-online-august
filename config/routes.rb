Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :menu, only: [:index, :create, :new]
  resources :dishes, only: [:new, :show, :create]

end
