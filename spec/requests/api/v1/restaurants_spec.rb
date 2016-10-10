require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /v1/restaurants' do

    let!(:owner) { create(:user, email: 'whatever@random_restaurant.com', role: 'owner') }
    let!(:restaurant) { create(:restaurant, user: owner) }

    it 'should return json with restaurants' do
      get '/api/v1/restaurants'
      json_response = JSON.parse(response.body).except('created_at', 'updated_at')
      expect(response.status).to eq 200
      binding.pry
      expect(json_response['restaurants']).to eq [{"id"=>1,
                                                    "name"=>"MyString",
                                                    "description"=>"MyText",
                                                    "user_id"=>1,
                                                    "created_at"=>restaurant.created_at.strftime("%Y-%m-%dT%H:%M:%S Z"),
                                                    "updated_at"=>restaurant.updated_at.to_json.to_s,
                                                    "street"=>"Fjällgatan 3",
                                                    "zipcode"=>41463,
                                                    "town"=>"Gothenburg",
                                                    "latitude"=>57.696531,
                                                    "longitude"=>11.9448777,
                                                    "category"=>"Thai"}]

    end

  end

end
