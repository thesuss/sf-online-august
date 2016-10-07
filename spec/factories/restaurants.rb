FactoryGirl.define do
  factory :restaurant do
    name 'MyString'
    category 'Thai'
    description 'MyText'
    street 'Fjällgatan 3'
    zipcode '41463'
    town 'Gothenburg'
    user {association(:user)}
  end
end
