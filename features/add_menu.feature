Feature: As a restaurant Owner
  in order to sell food
  I need to be able to add one or more menus.

Scenario: Viewing the Add Menu page
  Given I am on the "add menu" page
  Then I should see:
    | content    |
    | add menu   |
  And I should see "create" button

Scenario: Adding a menu
  Given I am on the "add menu" page
  When I fill in "title" with "Awesome Menu"
  And I click the "create" button
  Then I should see "Successfully added menu"
