class CartsController < ApplicationController
  def index
  end

  def add_item
    @cart = ShoppingCart.create
    binding.pry

    @dish = Dish.find(params[:dish_id])
    @cart.add(@dish)
  end
end
