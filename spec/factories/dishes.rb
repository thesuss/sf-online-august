FactoryGirl.define do
  factory :dish do
    name 'MyString'
    description 'MyText'
    price 1
    allergies 'MyText'
    calories 1
    ingredients 'MyText'
    restaurant {association(:restaurant)}
  end
end
