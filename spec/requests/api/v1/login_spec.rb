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

    it 'invalid password returns error message' do
      post '/api/v1/auth/sign_in', params: {
        email: customer.email, password: 'wrong_password'
      }, headers: headers

      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']
      expect(response.status).to eq 401
    end

    it 'invalid email returns error message' do
      post '/api/v1/auth/sign_in', params: {
        email: 'wrong@email.com', password: customer.password
      }, headers: headers

      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']
      expect(response.status).to eq 401
    end
  end
end
