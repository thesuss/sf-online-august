class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
