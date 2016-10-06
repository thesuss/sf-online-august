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
      | dish_name | dish_desc       | dish_price |
      | Kebab     | Delicious kebab | 9000       |

  Scenario: Navigating to edit page
    Given I am on the "show dish" page for "Kebab"
    And I click the link "Edit"
    Then I should be on the "edit dish" page for "Kebab"

  Scenario: Edit dish details
    Given I am on the "edit dish" page for "Kebab"
    And I fill in "Dish description" with "Kebab med sås"
    And I click the "Update Dish" button
    Then I should be on the "show dish" page for "Kebab"

  Scenario: I should be the only one who can edit my dishes
    Given the following users exist
      | name  | email         | role  |
      | Anna  | anna@food.se  | owner |
      | Bosse | bosse@food.se | owner |
    When I log in as "Bosse"
    And I visit the restaurant page for "Anna"
    And I click the link "Edit"
    Then I should see "You are not authorized to access this page."
