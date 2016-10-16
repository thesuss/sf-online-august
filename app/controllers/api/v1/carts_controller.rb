class Api::V1::CartsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_or_create_cart, only: [:update, :checkout]

  def create
    dish = Dish.find(params[:dish_id])
    cart = ShoppingCart.create
    cart.add dish, dish.price
    render json: ({cart_id: cart.id, dish_id: cart.shopping_cart_items[0].item.id})
  end

  def update
    dish = Dish.find(params[:dish_id])
    @cart.add(dish, dish.price)
  rescue
    render json: ({'error' => 'Dish ID was invalid'})
  end

  def checkout
    @cart = ShoppingCart.find(params[:id])
    @cart.user_id = params[:user_id]
    if @cart.user_id.nil?
      render json: ({ 'message' => 'Cart not associated with a customer' })
    end
    @cart.paid = true
  end


  private
  def find_or_create_cart
    @cart = ShoppingCart.find_or_create_by(id: params[:id])
  end

end
