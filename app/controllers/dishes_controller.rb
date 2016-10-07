class DishesController < ApplicationController
  before_action :find_dish_from_params, only: [:show, :edit, :update]

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

  def edit
  end

  def update
    if @dish.update(dish_params)
      render :show
    else
      flash[:alert] = @dish.errors.full_messages.first
      render :edit
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_name, :dish_desc, :dish_price, :dish_allergy, :dish_ingredients, :dish_cal, {menu_ids: []})
  end

  def find_dish_from_params
    @dish = Dish.find(params[:id])
  end
end
