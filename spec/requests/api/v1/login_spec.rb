require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:customer) { create(:user, role: 'customer')}
  let(:headers) { { HTTP_ACCEPT: 'application/json' } } 

  describe 'POST api/v1/auth/sign-in' do
    it 'valid credentials returns customer' do
      post '/api/v1/auth/sign_in', params: {
        email: customer.email, password: customer.password
      }, headers: headers

      expected_response = {
        'data' => {
          'id' => customer.id,
          'email' => customer.email,
          'provider' => 'email',
          'name' => customer.name,
          'address' => customer.address,
          'role'=>'customer',
          'uid' => customer.email
          }
      }
      expect(response_json).to eq expected_response
    end
  end
end
