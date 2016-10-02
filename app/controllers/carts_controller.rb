class CartsController < ApplicationController
  before_action :find_or_create_cart, only: [:index, :add_item]

  def index
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    @cart.add(@dish, @dish.dish_price)
    redirect_back(fallback_location: restaurant_path)
  end

  def checkout
    @order = ShoppingCart.find(params[:format])
    session.delete(:cart_id)
    flash[:success] = "Your food is on its way!"
    # In a later feature this needs to create some action item to actually make the order happen.
    # Restrict this function to a Customer
  end

  private
  def find_or_create_cart
    @cart = ShoppingCart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end
end
