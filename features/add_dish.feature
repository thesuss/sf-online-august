Feature: As a restaurant Owner
  in order to sell food
  I need to be able to add one or more dishes to my menus.

Background:
  Given the following menus exist:
    | menu   |
    | Lunch  |
    | Dinner |

Scenario: I create a dish and put it on a menu
  Given I am on the "Create Dish" page
  Then I should see:
    | content             |
    | Menu                |
  When I fill in:
    | element          | content              |
    | Dish Name        | Pizza                |
    | Dish description | Delicious pizza      |
    | Price            | 7000kr               |
  And select "Lunch" from "Add to a menu"
  When I click the "Add a Dish" button
  And visit the "Lunch" menu page
