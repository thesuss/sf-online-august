Given(/^the following (?:dish|dishes) exist$/) do |table|
  restaurant = Restaurant.first
  table.hashes.each do |hash|
    FactoryGirl.create(:dish, hash.merge!(restaurant: restaurant))
  end
end

Given(/^there is one dish in my cart$/) do
  steps %q{Given the following dish exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 70         |
    And I am on the dish page for "Pizza"
    Then I click the link "Add to cart"}
end

Given(/^there are two dishes in my cart$/) do
  steps %q{Given the following dish exist
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
  steps %q{
    And I am on the "cart" page
    When I click the "Pay with Card" stripe button
    And I fill in appropriate card details
    And I submit the stripe form
    Then I should see:
      | content                  |
      | Your food is on its way! |
      | Pizza                    |
    And my order should be registered in the system
  }
end

And(/^I check out but something goes wrong$/) do
  StripeMock.prepare_card_error(:card_declined)
  steps %q{
    And I am on the "cart" page
    When I click the "Pay with Card" stripe button
    And I fill in appropriate card details
    And I submit the stripe form
  }
end


And(/^I fill in appropriate card details$/) do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  Capybara.within_frame stripe_iframe do
    fill_in 'Email', with: 'random@morerandom.com'
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2021'
  end
end

And(/^I submit the stripe form$/) do
  cart = ShoppingCart.last
  stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  Capybara.within_frame stripe_iframe do
    click_button "Pay kr#{sprintf('%.2f', cart.total.to_i)}"
  end
  # sleep(1) --> Uncomment this line if you're running live tests with actual API calls to Stripe
end

When(/^I click the "([^"]*)" stripe button$/) do |arg|
  find('.stripe-button-el').trigger('click')
end

Then(/^my order should be registered in the system$/) do
  cart = ShoppingCart.last
  expect(cart.stripe_customer).not_to eq nil
end
