Given(/^the following dish exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish, hash)
  end
end

Given(/^the following dishes are in my cart:$/) do |table|
  steps %Q{Given the following dish exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 7000       |
    | Hamburger | So meaty        | 100        |
    And I am on the "dish" page for "Pizza"
    Then I click the link "Add to cart"
    When I am on the "dish" page for "Hamburger"
    Then I click the link "Add to cart"}
end
