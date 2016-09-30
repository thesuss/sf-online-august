class DishesController < ApplicationController
  def new
    @dish = Dish.new
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
    @dish = Dish.find(params[:id])
  end

  private
  def dish_params
    params.require(:dish).permit(:dish_name, :dish_desc, :dish_price, :dish_allergy, :dish_ingredients, :dish_cal)
  end
end
