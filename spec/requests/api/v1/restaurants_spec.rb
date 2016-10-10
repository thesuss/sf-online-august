require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /v1/restaurants' do

    let!(:owner) { create(:user, email: 'whatever@random_restaurant.com', role: 'owner') }
    let!(:restaurant) { create(:restaurant, user: owner) }

    it 'should return json with restaurants' do
      get '/api/v1/restaurants'
      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_response['restaurants']).to eq [{"id"=>1,
                                                    "name"=>"MyString",
                                                    "description"=>"MyText",
                                                    "user_id"=>1,
                                                    "created_at"=>"2016-10-10T14:10:47.228Z",
                                                    "updated_at"=>"2016-10-10T14:10:47.228Z",
                                                    "street"=>"Fjällgatan 3",
                                                    "zipcode"=>41463,
                                                    "town"=>"Gothenburg",
                                                    "latitude"=>57.696531,
                                                    "longitude"=>11.9448777,
                                                    "category"=>"Thai"}]

    end

  end

end
