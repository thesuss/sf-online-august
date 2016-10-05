Feature: As a visitor
  in order to get a good impression of Best Slow Food
  I need to get a useful error and redirection when visiting
  a page for a thing that doesn't exist.

Scenario: I visit a restaurant page that doesn't exist
  Given I try to visit the restaurant page for a restaurant that doesn't exist
  Then I should be on the "index" page
  And I should see "Restaurant not found"

Scenario: I visit a dish page that doesn't exist
  Given I try to visit the dish page for a dish that doesn't exist
  Then I should be on the "index" page
  And I should see "Dish not found"

Scenario: I visit a menu page that doesn't exist
  Given I try to visit the menu page for a menu that doesn't exist
  Then I should be on the "index" page
  And I should see "Menu not found"
