Feature: As a Customer
  in order to place an order
  I need to be able to add dishes to my cart.

Scenario: Adding dish to cart
  Given the following dish exist
  | dish_name | dish_desc       | dish_price |
  | Pizza     | Delicious pizza | 7000       |
  And I am on the "dish" page for "Pizza"
  When I click the link "Add to cart"
  Then I should see "Delicious pizza"
  And I click the link "Show cart"
  Then I should be on the "cart" page
  And I should see "700000"
  And I should see "Pizza"

Scenario: Checking out
  Given the following dishes are in my cart:
    | dish      |
    | Pizza     |
    | Hamburger |
  And I am on the "cart" page
  When I click the link "Pay Now"
  Then I should be on the "success" page
  And I should see "Your food is on its way!"
  And I should see "Pizza"
  And I should see "Hamburger"
