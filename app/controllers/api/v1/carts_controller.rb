class Api::V1::CartsController < ApplicationController


  def create
    dish = Dish.find(params[:dish_id])
    cart = ShoppingCart.create
    cart.add dish, dish.price
    #binding.pry
    render json: ({cart_id: cart.id, dish_id: cart.shopping_cart_items[0].item.id})
  end
end
