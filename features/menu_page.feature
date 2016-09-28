Feature: As a restaurant Owner
  in order to show more menu details
  I need to have a Menu page for each Menu.

Scenario: Viewing the Menu page
  Given I am on the "menu" page
  Then I should see:
    | content    |
    | Menu for X |
    | Dish 1     |

Scenario: Browsing to the Menu page
  Given I am on the "restaurant" page
  When I click the link "Link to menus"
  Then I should be on the "menu" page
