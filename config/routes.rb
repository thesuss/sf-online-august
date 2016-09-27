Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index
  get '/menu', controller: :menu, action: :index

end
