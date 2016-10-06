Feature: As a visitor/customer
  In order to easily browse restaurants, dishes and menus
  There needs to be a clear flow between them

Background:
  Given the following users exist
    | name  | email         | role  |
    | Anna  | anna@food.se  | owner |
  And the following restaurants exists
    | name | description | town | owner |
    | McD  | Nice food   | Home | Anna  |
  And "Anna" has a menu "Lunch"
  And the following dishes exist
    | dish_name | dish_desc       | dish_price | restaurant |
    | Pizza     | Delicious pizza | 70         | McD        |
    | Salad     | Leafy           | 15         | McD        |
  And I log in as "Anna"
  And I add "Pizza" to the "Lunch" menu

Scenario: Index should link to restaurants
  Given I am on the "index" page
  Then I should see:
    | content |
    | McD     |
  When I click the link "McD"
  Then I should be on the restaurant page for "McD"

Scenario: Restaurant pages should link to menus
  Given I am on the restaurant page for "McD"
  Then I should see "Lunch"
  When I click the link "Lunch"
  Then I should be on the menu page for "Lunch"

Scenario: Menus should link to dishes
  Given I am not logged in
  And I am on the menu page for "Lunch"
  Then I should see "Pizza"
  When I click the link "Pizza"
  Then I should be on the dish page for "Pizza"

Scenario: Menu page should have edit link
  Given I am on the menu page for "Lunch"
  And I click the link "Edit menu"
  Then I should be on the edit menu page for "Lunch"

Scenario: Menu page should NOT have edit link for visitors
  Given I am not logged in
  And I am on the menu page for "Lunch"
  Then I should not see "Edit menu"

# Avvatar jespers PR
# Scenario: Dish page should have edit link
#   Given I am on the dish page for "Pizza"
#   And I click the link "Edit dish"
#   Then I should be on the edit dish page for "Pizza"

Scenario: Dish page should NOT have edit link for visitors
  Given I am not logged in
  And I am on the dish page for "Pizza"
  Then I should not see "Edit menu"
