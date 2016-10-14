require 'rails_helper'

RSpec.describe Api::V1::CartsController do
  let(:restaurant) { create(:restaurant) }
  let(:dish) { create(:dish, restaurant: restaurant) }

  it 'adds a dish to a new cart' do
    post '/api/v1/carts', {params: {dish_id: dish.id}}

    expect(ShoppingCart.count).to eq 1
    expect(response_json).to eq({'cart_id' => 1, 'dish_id' => dish.id})
  end
end
