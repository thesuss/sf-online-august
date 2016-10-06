FactoryGirl.define do
  factory :dish do
    dish_name 'MyString'
    dish_desc 'MyText'
    dish_price 1
    dish_allergy 'MyText'
    dish_cal 1
    dish_ingredients 'MyText'
    restaurant {association(:restaurant)}
  end
end
