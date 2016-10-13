class Api::V1::LoginController < DeviseTokenAuth::SessionsController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  binding.pry
end
