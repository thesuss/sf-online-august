class Api::V1::RestaurantsController < ApplicationController
  def index
    @collection = Restaurant.all
    render json: { restaurants: @collection }
  end
end
