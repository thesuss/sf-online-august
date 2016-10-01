class CartsController < ApplicationController
  def index
    @cart = ShoppingCart.first
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    @cart = ShoppingCart.create # Needs to be find or create - find_or_create_by() - when we implement current_user

    @cart.add(@dish, @dish.dish_price)
    redirect_back(fallback_location: restaurant_path)
  end

  def checkout
    @order = ShoppingCart.find(params[:format])
    flash[:success] = "Your food is on its way!"
    # Somehow confirming that money has changed hands.
    # Restrict this function to a Customer
  end
end
