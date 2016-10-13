require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:customer) { create(:user, role: 'customer')}

  describe 'POST api/v1/auth/sign-in' do
    it 'valid credentials returns customer' do
      post '/api/v1/auth/sign_in', params: {
        email: customer.email, password: customer.password
      }

      expected_response = {
        'data' => {
          'id' => customer.id,
          'uid' => customer.email,
          'email' => customer.email,
          'provider' => 'email',
          'name' => nil,
          'nickname' => nil,
          'image' => nil,
          'address' => customer.address
        }
      }

      expect(response_json).to eq expected_response
    end
  end
end
