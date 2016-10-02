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

Scenario: Can only checkout as registered user
  Given there is one dish in my cart
  And I am on the "cart" page
  When I click the link "Log in to pay"
  Then I should be on the "register" page
  When I there register as a user with username "Amber" and email "amber@random.com"
  Then I should be on the "cart" page
  And I should see "Pay Now"
  And I should not see "Log in to pay"

Scenario: Checking out as registered user
  Given I register as a user with username "Amber" and email "amber@random.com"
  And there is one dish in my cart
  And I am on the "cart" page
  When I click the link "Pay Now"
  Then I should see:
    | content                  |
    | Your food is on its way! |
    | Pizza                    |
    | 700000                   |
    | Fjällgatan 3             |

Scenario: I view the cart before I add dishes
  Given there are no dishes in my cart
  And I am on the "cart" page
  Then I should see "You have no dishes in your cart."
  And I should see "Search for dishes!"

Scenario: Adding two dishes to cart
  Given I register as a user with username "Amber" and email "amber@random.com"
  And there are two dishes in my cart
  And I am on the "cart" page
  Then I should see "Pizza"
  And I should see "Salad"
  When I click the link "Pay Now"
  Then I should see "Pizza"
  And I should see "Salad"

Scenario: My cart clears after checkout
  Given I register as a user with username "Amber" and email "amber@random.com"
  And there are two dishes in my cart
  And I check out
  When I am on the "cart" page
  Then I should see "You have no dishes in your cart."
