Feature: As a restaurant owner
  in order to change my mind
  I need to be able to edit dishes

  Background:
    Given the following owners exist:
      | name |
      | Anna |
    And "Anna" is logged in as restaurant owner
    And "Anna" has a restaurant
    And the following dishes exist
      | name | description       | price |
      | Kebab     | Delicious kebab | 9000       |

  Scenario: Navigating to edit page
    Given I am on the dish page for "Kebab"
    And I click the link "Edit dish"
    Then I should be on the edit dish page for "Kebab"

  Scenario: Edit dish details
    Given I am on the edit dish page for "Kebab"
    And I fill in "Dish description" with "Kebab med sås"
    And I click the "Submit" button
    Then I should be on the dish page for "Kebab"

  Scenario: I should be the only one who can edit my dishes
    Given the following users exist
      | name  | email         | role  |
      | Bosse | bosse@food.se | owner |
    And I log in as "Bosse"
    And I visit the restaurant page for "Anna"
    Then I should not see "Edit dish"

  Scenario: Visitors can not edit dishes
    Given I am not logged in
    And I am on the dish page for "Kebab"
    Then I should not see "Edit dish"

  Scenario: Customers can not edit dishes
    Given the following users exist
      | name  | email         | role     |
      | Emma  | emma@food.se  | customer |
    And I log in as "Emma"
    And I am on the dish page for "Kebab"
    Then I should not see "Submit"

  Scenario: I mess up the edit for dish
    Given I am on the dish page for "Kebab"
    And I click the link "Edit dish"
    And I fill in "Dish Name" with ""
    And I click the "Submit" button
    Then I should see "Name can't be blank"
