require 'rails_helper'

RSpec.describe Api::V1::CartsController do
  let(:restaurant) { create(:restaurant) }
  let(:dish) { create(:dish, restaurant: restaurant) }
  let(:dish2) { create(:dish, restaurant: restaurant) }
  let(:cart) { create(:shopping_cart)}

  it 'creates an order' do
    post '/api/v1/checkout', {params: {id: cart.id}}
    expect(response_json).to eq({'status' => 'Checkout successful'})
  end
end