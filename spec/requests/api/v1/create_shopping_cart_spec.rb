require 'rails_helper'

RSpec.describe Api::V1::CartsController do
  let(:restaurant) { create(:restaurant) }
  let(:dish) { create(:dish, restaurant: restaurant) }
  let(:dish2) { create(:dish, restaurant: restaurant) }

  it 'adds a dish to a new cart' do
    post '/api/v1/carts', {params: {dish_id: dish.id}}

    expect(ShoppingCart.count).to eq 1
    expect(response_json).to eq({'cart_id' => ShoppingCart.last.id, 'dish_id' => dish.id})
  end

  describe 'adding more dishes to cart' do
    let(:cart) { create(:shopping_cart)}

    it 'adds a second dish to the cart' do
      cart.add(dish, dish.price)
      put "/api/v1/carts/#{cart.id}", {params: {dish_id: dish2.id}}

      expect(response_json).to eq({'cart_id' => cart.id, 'dishes' => [{'dish_id' => dish.id}, {'dish_id' => dish2.id}]})
    end

    it 'fails to add a second dish to the cart' do
      cart.add(dish, dish.price)
      put "/api/v1/carts/#{cart.id}", {params: {dish_id: 'garbage', cart_id: cart.id}}

      expect(response_json).to eq({'error' => 'Dish ID was invalid'})
    end

  end

end
