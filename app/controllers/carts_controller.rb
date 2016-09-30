class CartsController < ApplicationController
  def index
    @cart = ShoppingCart.first
    #find(params[:item_id])
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    @cart = ShoppingCart.create

    @cart.add(@dish, @dish.dish_price)
    redirect_back(fallback_location: restaurant_path)
  end
end
