Feature: As a restaurant Owner
  in order to set up my menu
  I need to be able to create Dishes.

  Background:
    Given I am logged in as a restaurant owner
    And I already have a restaurant

  Scenario: I create a dish
    Given I am on the "Create Dish" page
    Then I should see:
      | content          |
      | Add a Dish       |
      | Dish Name        |
      | Dish description |
      | Price            |
      | Allergy Info     |
      | Ingredients      |
      | Calories         |

    When I fill in:
      | element          | content              |
      | Dish Name        | Pizza                |
      | Dish description | Delicious pizza      |
      | Price            | 7000kr               |
      | Allergy Info     | gluten               |
      | Ingredients      | cheese, sauce, crust |
      | Calories         | 10000                |
    And I click the "Submit" button
    And I should see:
      | content              |
      | Pizza                |
      | Delicious pizza      |
      | 7000                 |
      | gluten               |
      | cheese, sauce, crust |
      | 10000                |

  Scenario: I attempt to create a dish with bad info
    Given I am on the "Create Dish" page
    When I fill in:
      | element          | content         |
      | Dish Name        |                 |
      | Dish description | Delicious pizza |
      | Price            | 7000kr          |
    And I click the "Submit" button
    Then I should see "Name can't be blank"

  Scenario: I attempt to create a dish without description
    Given I am on the "Create Dish" page
    When I fill in:
      | element          | content |
      | Dish Name        | Pizza   |
      | Dish description |         |
      | Price            | 7000kr  |
    And I click the "Submit" button
    Then I should see "Description can't be blank"

  Scenario: I attempt to create a dish without price
    Given I am on the "Create Dish" page
    When I fill in:
      | element          | content         |
      | Dish Name        | pizza           |
      | Dish description | Delicious pizza |
      | Price            |                 |
    And I click the "Submit" button
    Then I should see "Price can't be blank"
