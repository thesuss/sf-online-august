require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :request do
  describe 'GET /v1/restaurants' do
    it 'should return json with restaurants' do
      get '/api/v1/restaurants'

      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_response['restaurants']).to eq 'Lots of stuff'
    end
  end
end
