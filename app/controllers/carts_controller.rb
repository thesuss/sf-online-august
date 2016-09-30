class CartsController < ApplicationController
  def index
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    @cart = ShoppingCart.create

    @cart.add(@dish, @dish.dish_price)
    redirect_to carts_path
  end
end
