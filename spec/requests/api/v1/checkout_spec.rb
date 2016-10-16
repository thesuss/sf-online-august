require 'rails_helper'

RSpec.describe Api::V1::CartsController do
  let(:restaurant) { create(:restaurant) }
  let(:dish) { create(:dish, restaurant: restaurant) }
  let(:dish2) { create(:dish, restaurant: restaurant) }
  let!(:cart) { create(:shopping_cart)}
  let(:customer) { create(:user)}

  it 'returns list of items in order with price & total price' do
    cart.add(dish, dish.price)
    cart.add(dish2, dish2.price)
    post '/api/v1/checkout', {params: {id: cart.id, user_id: customer.id}}
    expect(response_json).to eq({ 'cart_id' => cart.id,
                                  'dishes'=>[{'name'=> dish.name,
                                             'price' => dish.price },
                                            {'name'=> dish2.name,
                                             'price' => dish2.price }],
                                  'total'=> cart.total.to_i,
                                  'message' => 'Your food is on its way!' })
  end

  it 'returns an error message if not signed in' do
    cart.add(dish, dish.price)
    post '/api/v1/checkout', {params: {id: cart.id, user_id: 'nonsense'}}
    expect(response_json).to eq({ 'message' => 'Cart not associated with a customer' })
    expect(cart.paid).to eq false
  end

  it 'returns error message if there are no dishes in the cart' do
    post '/api/v1/checkout', {params: {id: cart.id, user_id: customer.id}}
    expect(response_json).to eq({ 'message' => 'No dishes in cart' })
    expect(cart.paid).to eq false
  end
end
