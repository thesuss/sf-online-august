class CartsController < ApplicationController
  def index
    if session[:cart_id] == nil
      @cart = nil
    else
      @cart = ShoppingCart.find(session[:cart_id])
    end
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    if session[:cart_id] == nil
      @cart = ShoppingCart.create
      session[:cart_id] = @cart.id
    else
      @cart = ShoppingCart.find(session[:cart_id])
    end
    # Needs to be find or create - find_or_create_by() - when we implement current_user

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
end
