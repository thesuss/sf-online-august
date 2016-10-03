FactoryGirl.define do
  factory :restaurant do
    name 'MyString'
    description 'MyText'
    street 'My Street'
    zipcode '99912'
    town 'GothenburgCity'
    user {association(:user)}
  end
end
