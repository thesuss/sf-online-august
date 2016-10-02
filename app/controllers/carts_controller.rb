class CartsController < ApplicationController
  def index
    find_or_create_cart
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    find_or_create_cart
    @cart.add(@dish, @dish.dish_price)
    redirect_back(fallback_location: restaurant_path)
  end

  def checkout
    @order = ShoppingCart.find(params[:format])
    session.delete(:cart_id)
    flash[:success] = "Your food is on its way!"
    # Somehow confirming that money has changed hands.
    # Restrict this function to a Customer
  end

  private
  def find_or_create_cart
    if session[:cart_id] == nil
      @cart = ShoppingCart.create
      session[:cart_id] = @cart.id
    else
      @cart = ShoppingCart.find(session[:cart_id])
    end
  end
end
