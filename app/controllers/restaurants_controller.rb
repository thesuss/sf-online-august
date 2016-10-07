class RestaurantsController < ApplicationController
  load_and_authorize_resource # potentially refactor this into ApplicationController
  before_action :check_for_exisiting_restaurant, only: [:new]
  before_action :find_restaurant_from_params, only: [:show, :edit, :update]

  def index
    gon.restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @headline = "Create restaurant"
  end

  def create
    @restaurant = Restaurant.new(restaurant_params.merge({user: current_user}))
    if @restaurant.save
      @headline = "#{@restaurant.name}"
      render :show
    else
      flash[:alert] = @restaurant.errors.full_messages.first
      render :new
    end
  end

  def show
    @headline = "#{@restaurant.name}"
  end

  def edit
    @headline = "Editing #{@restaurant.name}"
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      @headline = "#{@restaurant.name}"
      render :show
    else
      flash[:alert] = @restaurant.errors.full_messages.first
      @restaurant.reload
      render :edit
    end
  end


  private

  def check_for_exisiting_restaurant
    unless current_user.restaurant.nil?
      flash[:alert] = 'You already have a restaurant, how many do you need?'
      redirect_back(fallback_location: root_path)
    end
  end

  def find_restaurant_from_params
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name,
                                       :category,
                                       :description,
                                       :street,
                                       :zipcode,
                                       :town)
  end
end
