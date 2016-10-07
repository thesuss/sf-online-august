@javascript @stripe
Feature: As a Customer
  in order to place an order
  I need to be able to add dishes to my cart.

  Background:
    Given the following owners exist:
      | name |
      | Anna |
    And "Anna" has a restaurant
    And the following dish exist
      | dish_name | dish_desc       | dish_price |
      | Pizza     | Delicious pizza | 7000       |
      | Salad     | Leafy           | 200        |

  Scenario: Adding dish to cart
    Given I am on the dish page for "Pizza"
    When I click the link "Add to cart"
    Then I should see "Delicious pizza"
    And I click the link "Show cart"
    Then I should be on the "cart" page
    And I should see "Pizza"

  Scenario: Can only checkout as registered user
    Given there is one dish in my cart
    And I am on the "cart" page
    Then I should not see "Pay with Card"
    When I click the link "Log in to pay"
    Then I should be on the "register" page
    When I register as a user with username "Amber" and email "amber@random.com"
    Then I should be on the "cart" page
    And I should see "Pay with Card"
    And I should not see "Log in to pay"

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

  Scenario: My cart gives me an appropriate total
    Given I am on the dish page for "Pizza"
    And I click the link "Add to cart"
    And I am on the dish page for "Salad"
    And I click the link "Add to cart"
    When I am on the "cart" page
    Then I should see "Total: 7200"
