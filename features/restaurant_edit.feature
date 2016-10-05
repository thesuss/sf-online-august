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

  Scenario: My geolocation gets updated when I update my address
    Given I am on the restaurant page for "Awesome"
    Then "Awesome" should have lat "57.7089" and long "11.9746"
    And I click the link "Edit"
    When I fill in "Street" with "Blåsbackegatan 17"
    And I click the "Submit" button
    Then "Awesome" should have lat "56.6755" and long "12.8783"
