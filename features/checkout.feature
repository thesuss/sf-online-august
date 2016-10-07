@javascript @stripe
Feature: As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

  Background:
    Given the following owners exist:
      | name | email           |
      | Anna | anna@random.com |
    And "Anna" has a restaurant
    And there is one dish in my cart

  Scenario: I check out and pay with my credit card
    Given I am logged in as a user
    And I am on the "cart" page
    When I click the "Pay with Card" stripe button
    And I fill in appropriate card details
    And I submit the stripe form
    Then I should see:
      | content                  |
      | Your food is on its way! |
      | Pizza                    |
    And my order should be registered in the system

  Scenario: My cart clears after checkout
    Given I register as a user with username "Amber" and email "amber@random.com"
    And I check out
    When I am on the "cart" page
    Then I should see "You have no dishes in your cart."

  Scenario: I see the "register to pay" button if I'm not logged in
    Given I am on the "cart" page
    Then I should see "Log in to pay"
    And I should not see "Pay with Card"

  Scenario: Redirects to carts page on error
    Given I register as a user with username "Amber" and email "amber@random.com"
    And I check out but something goes wrong
    Then I should be on the "cart" page
    Then I should see "The card was declined Please try again"
