class Api::V1::CartsController < ApplicationController


  def create
    dish = Dish.find(params[:dish_id])
    cart = ShoppingCart.create
    cart.add dish, dish.price
    render json: ({cart_id: cart.id, dish_id: cart.shopping_cart_items[0].item.id})
  end

  def update
    @cart = ShoppingCart.find_or_create_by(id: params[:cart_id])
    dish = Dish.find(params[:dish_id])
    @cart.add(dish, dish.price)
  end

end
