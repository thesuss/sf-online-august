class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    #render :'api/v1/restaurants/index'
  end
end
