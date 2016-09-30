Rails.application.routes.draw do
  get '/restaurant', controller: :restaurants, action: :index

  resources :menus, only: [:index, :create, :new]
  resources :dishes, only: [:new, :show, :create]

end
