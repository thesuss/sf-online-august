Feature: As a restaurant Owner
  in order to sell food
  I need to be able to add one or more menus.

  Background:
    Given I am logged in as a restaurant owner
    And I already have a restaurant

  Scenario: Viewing the Add Menu page
    Given I am on the "add menu" page
    Then I should see:
      | content  |
      | Add menu |
    And I should see "create" button

  Scenario: Adding a menu
    Given I am on the "add menu" page
    When I fill in "title" with "Awesome Menu"
    And I click the "create" button
    Then I should see "Successfully added menu"

  Scenario: Adding a menu with a dish
    Given I have the following dishes:
      | name   |
      | Pizza  |
      | Olives |
    When I am on the "add menu" page
    And I fill in "title" with "Salty Menu"
    And I check the "Olives" box
    And I click the "create" button
    And I should see "Dishes: Olives"

  Scenario: Viewing my menu
    Given I create a menu "Lunch"
    Then I should see "Successfully added menu"
    Then I should see "Lunch"

  Scenario: Not adding a menu
    Given I am on the "add menu" page
    When I fill in:
      | element | content |
      | title   |         |
    And I click the "create" button
    Then I should see "Title can't be blank"

  Scenario: I attempt to access the create menu page when not logged in
    Given I am not logged in
    When I am on the "add menu" page
    Then I should be on the "index" page
    And I should see "You are not authorized to access this page"
