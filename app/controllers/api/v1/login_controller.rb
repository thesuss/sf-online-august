class Api::V1::LoginController < DeviseTokenAuth::SessionsController
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
end
