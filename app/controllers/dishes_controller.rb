class DishesController < ApplicationController
  load_and_authorize_resource
  before_action :owner_has_restaurant?, only: :new

  def new
    @dish = Dish.new
    @menus = Menu.where(restaurant: current_user.restaurant)
    @headline = "Add a Dish to your restaurant"
  end

  def create
    @dish = current_user.restaurant.dishes.create(dish_params)
    if @dish.save
      @headline = "#{@dish.dish_name}"
      render :show
    else
      flash[:alert] = @dish.errors.full_messages.first
      render :new
    end
  end

  def show
    @dish = Dish.find(params[:id])
    @headline = "#{@dish.dish_name}"
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_name, :dish_desc, :dish_price, :dish_allergy, :dish_ingredients, :dish_cal, {menu_ids: []})
  end
end
