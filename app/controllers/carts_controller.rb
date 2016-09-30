class CartsController < ApplicationController
  def index
    #binding.pry
    @cart = ShoppingCart.first
    binding.pry
    #find(params[:item_id])
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    @cart = ShoppingCart.create

    @cart.add(@dish, @dish.dish_price)
    redirect_back(fallback_location: restaurant_path)
  end
end
