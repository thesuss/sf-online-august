require 'rails_helper'

RSpec.describe Api::V1::CartsController do
  let(:restaurant) { create(:restaurant) }
  let(:dish) { create(:dish, restaurant: restaurant) }
  let(:dish2) { create(:dish, restaurant: restaurant) }

  it 'adds a dish to a new cart' do
    post '/api/v1/carts', {params: {dish_id: dish.id}}

    expect(ShoppingCart.count).to eq 1
    expect(response_json).to eq({'cart_id' => 1, 'dish_id' => dish.id})
  end

  it 'adds a second dish to the cart' do
    @cart = ShoppingCart.create
    @cart.add(dish, dish.price)
    put '/api/v1/carts/1', {params: {dish_id: dish2.id, cart_id: @cart.id}}

    expect(response_json).to eq({'cart_id' => @cart.id, 'dishes' => [{'dish_id' => dish.id}, {'dish_id' => dish2.id}]})
  end
end
