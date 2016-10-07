FactoryGirl.define do
  factory :user do
    name 'Name'
    address 'User Address'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
