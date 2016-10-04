Feature: As a visitor/customer
  In order to easily browse restaurants, dishes and menus
  There needs to be a clear flow between them

Background:
  Given I am logged in as a restaurant owner
  And the following menus exist:
    | title |
    | Lunch |
  And the following dishes exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 70         |
    | Salad     | Leafy           | 15         |
    | Olives    | Salty           | 90         |
  And I add "Pizza" to the "Lunch" menu


#Waiting for Amber's PR to be merged
# Scenario: Restaurant pages should link to menus
#   Given I am on the restaurant page for "Awesome"
#   Then I should see "Lunch"
#   When I click the link "Lunch"
#   Then I should be on the menu page for "Lunch"

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
