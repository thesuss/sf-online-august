Feature: As a restaurant Owner
  in order to sell food
  I need to be able to display information on my Restaurant page.

Scenario: Viewing the restaurant page
  Given I am on the "restaurant" page
  Then I should see:
    | content             |
    | Picture             |
    | Restaurant Name     |
    | Restaurant info     |
    | Map                 |
    | Link to menus       |
    | Highlighted dishes  |
    | Comment and rate    |
