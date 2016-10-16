require 'rails_helper'

RSpec.describe Api::V1::CartsController do
  let(:restaurant) { create(:restaurant) }
  let(:dish) { create(:dish, restaurant: restaurant, name: 'Spaghetti') }
  let(:dish2) { create(:dish, restaurant: restaurant, name: 'Chocolate') }
  let(:cart) { create(:shopping_cart)}

  it 'returns list of items in order with price & total price' do
    cart.add(dish, dish.price)
    cart.add(dish2, dish2.price)
    post '/api/v1/checkout', {params: {id: cart.id}}
    expect(response_json).to eq({ 'cart_id' => cart.id,
                                  'dishes'=>[{'name'=> dish.name,
                                             'price' => dish.price },
                                            {'name'=> dish2.name,
                                             'price' => dish2.price }],
                                  'total'=> cart.total.to_i,
                                  'message' => 'Your food is on its way!' })
  end
end
