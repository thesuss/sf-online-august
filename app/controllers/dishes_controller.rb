class DishesController < ApplicationController
  before_action :find_dish_from_params, only: [:show, :edit, :update]

  load_and_authorize_resource
  before_action :owner_has_restaurant?, only: :new

  def new
    @dish = Dish.new
    @menus = Menu.where(restaurant: current_user.restaurant)
  end

  def create
    @dish = current_user.restaurant.dishes.create(dish_params)
    if @dish.save
      render :show
    else
      flash[:alert] = @dish.errors.full_messages.first
      render :new
    end
  end

  def show
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
    params.require(:dish).permit(:name, :description, :price, :allergies, :ingredients, :calories, {menu_ids: []})
  end

  def find_dish_from_params
    @dish = Dish.find(params[:id])
  end
end
