class RestaurantsController < ApplicationController
  load_and_authorize_resource # potentially refactor this into ApplicationController
  before_action :check_for_exisiting_restaurant, only: :new

  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params.merge({user: current_user}))
    if @restaurant.save
      render :show
    else
      flash[:alert] = @restaurant.errors.full_messages.first
      render :new
    end
  end

  def show
  end

  private

  def check_for_exisiting_restaurant
    unless current_user.restaurant.nil?
      flash[:alert] = "You already have a restaurant, how many do you need?"
      redirect_back(fallback_location: root_path)
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :street, :zipcode, :town)
  end
end
