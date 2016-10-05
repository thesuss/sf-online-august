FactoryGirl.define do
  factory :menu do
    title "title"
    restaurant {association(:restaurant)}
  end
end
