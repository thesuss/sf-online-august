FactoryGirl.define do
  factory :user do
    name "Name"
    address "Address"
    email "email@random.com"
    password "password"
    password_confirmation "password"
  end
end
