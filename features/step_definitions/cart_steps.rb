Given(/^the following (?:dish|dishes) exist$/) do |table|
  restaurant = Restaurant.first
  table.hashes.each do |hash|
    FactoryGirl.create(:dish, hash.merge!(restaurant: restaurant))
  end
end

Given(/^there is one dish in my cart$/) do
  steps %Q{Given the following dish exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 7000       |
    And I am on the dish page for "Pizza"
    Then I click the link "Add to cart"}
end

Given(/^there are two dishes in my cart$/) do
  steps %Q{Given the following dish exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 7000       |
    | Salad     | Leaves & stuff  | 1500       |
    And I am on the dish page for "Pizza"
    Then I click the link "Add to cart"
    And I am on the dish page for "Salad"
    Then I click the link "Add to cart"
    And the database says there are "2" dishes in my cart}
end

Given(/^there are no dishes in my cart$/) do
  expect(ShoppingCart.first).to eq nil
end

Given(/^the database says there (?:is|are) "([^"]*)" (?:dish|dishes) in my cart$/) do |count|
  expect(ShoppingCart.first.shopping_cart_items.count).to eq count.to_i
end

Given(/^I check out$/) do
  steps %Q{
    When I am on the "cart" page
    And I click the link "Pay Now"
    Then I should see "Pizza"
  }
end
