Feature: As a restaurant Owner
  in order to change my menu
  I need to be able to edit information on my Restaurant page.

  Background:
    Given I am logged in as a restaurant owner
    And the "Awesome" restaurant exists

  Scenario: I edit my restaurant
    Given I am on the restaurant page for "Awesome"
    And I click the link "Edit"
    When I fill in "Name" with "tacos"
    And I click the "Submit" button
    Then I should be on the show page for "tacos"
    And I should see "tacos"

  Scenario: I messed up the edit
    Given I am on the restaurant page for "Awesome"
    And I click the link "Edit"
    And I fill in "Name" with ""
    And I click the "Submit" button
    Then I should see "Name can't be blank"
