require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :request do

  describe 'GET /v1/restaurants' do
    let!(:owner) do
      create(:user, email: 'whatever@randomrestaurant.com', role: 'owner')
    end
    let!(:restaurant) { create(:restaurant, user: owner) }
    let!(:restaurant_2) { create(:restaurant, user: owner) }
    let!(:menu) { create(:menu, restaurant: restaurant) }

    it 'should return json with restaurants' do
      get '/api/v1/restaurants'
      expect(response.status).to eq 200
      expected_response = {
          'id' => restaurant.id,
          'name' => 'MyString',
          'description' => 'MyText',
          'user_id' => restaurant.user_id,
          'street' => 'Fjällgatan 3',
          'zipcode' => 41463,
          'town' => 'Gothenburg',
          'latitude' => 57.696531,
          'longitude' => 11.9448777,
          'category' => 'Thai'
      }
      expect(response_json['restaurants'][0]).to eq expected_response
    end

    it 'should return a list of restaurants' do
      get '/api/v1/restaurants'
      expect(response_json['restaurants'].size).to eq(2)
    end
  end

  describe 'GET /v1/restaurants/1' do
    let!(:owner) do
      create(:user, email: 'whatever@randomrestaurant.com', role: 'owner')
    end
    let!(:restaurant) { create(:restaurant, user: owner) }
    let!(:menu) { create(:menu, restaurant: restaurant) }
    let!(:menu2) { create(:menu, title: 'menu2', restaurant: restaurant) }
    let!(:dish) { create(:dish, name: 'dish1', restaurant: restaurant) }
    let!(:dish2) { create(:dish, name: 'dish2', restaurant: restaurant) }
    let!(:dish3) { create(:dish, name: 'dish3', restaurant: restaurant) }


    it 'should return json with restaurant, menus and dishes on show' do
      menu.dishes << dish
      menu2.dishes << dish2
      menu2.dishes << dish3
      get "/api/v1/restaurants/#{restaurant.id}"

      expected_response = {
          'id' => restaurant.id,
          'name' => restaurant.name,
          'description' => restaurant.description,
          'user_id' => restaurant.user_id,
          'street' => restaurant.street,
          'zipcode' => restaurant.zipcode,
          'town' => restaurant.town,
          'latitude' => restaurant.latitude,
          'longitude' => restaurant.longitude,
          'category' => restaurant.category,
          'menus' => [{'title' => menu.title,
                        'dishes' => [{ 'name' => dish.name,
                                       'description' => dish.description,
                                       'price' => dish.price,
                                       'category' => dish.category,
                                       'id' => dish.id }]},
                      {'title' => menu2.title,
                        'dishes' => [{ 'name' => dish2.name,
                                       'description' => dish2.description,
                                       'price' => dish2.price,
                                       'category' => dish2.category,
                                       'id' => dish2.id },
                                     { 'name' => dish3.name,
                                       'description' => dish3.description,
                                       'price' => dish3.price,
                                       'category' => dish3.category,
                                       'id' => dish3.id}]}]
      }
      expect(response_json).to eq expected_response
    end
  end
end
