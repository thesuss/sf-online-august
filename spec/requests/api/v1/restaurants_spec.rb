require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :request do
  
  describe 'GET /v1/restaurants' do
    let!(:owner) do
      create(:user, email: 'whatever@random_restaurant.com', role: 'owner')
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
      create(:user, email: 'whatever@random_restaurant.com', role: 'owner')
    end
    let!(:restaurant) { create(:restaurant, user: owner) }
    let!(:menu) { create(:menu, restaurant: restaurant) }
    let!(:menu2) { create(:menu, title: 'menu2', restaurant: restaurant) }
    let!(:dish) { create(:dish, name: 'dish1', restaurant: restaurant) }
    let!(:dish2) { create(:dish, name: 'dish2', restaurant: restaurant) }


    it 'should return json with restaurant, menus and dishes on show' do
      menu.dishes << dish
      menu2.dishes << dish2
      get "/api/v1/restaurants/#{restaurant.id}"

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
          'category' => 'Thai',
          'menus' => [{'title' => menu.title,
                        'dishes' => [{ 'dish' => dish.name }]},
                      {'title' => menu2.title,
                        'dishes' => [{ 'dish' => dish2.name }]}]
      }
      expect(response_json).to eq expected_response
    end
  end
end
