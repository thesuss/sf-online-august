class DishesController < ApplicationController
  before_action :authenticate_user!,
                :find_dish_from_params, only: [:show, :edit, :update]

  load_and_authorize_resource

  def new
    @dish = Dish.new
    @menus = Menu.all # Later on, we need to restrict this to only the menus of the current Owner
  end

  def create
    @dish = Dish.new(dish_params)
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
    params.require(:dish).permit(:dish_name, :dish_desc, :dish_price, :dish_allergy, :dish_ingredients, :dish_cal, {menu_ids: []})
  end

  def find_dish_from_params
    @dish = Dish.find(params[:id])
  end
end
