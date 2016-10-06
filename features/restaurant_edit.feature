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
    Then I should be on the restaurant page for "tacos"
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
    When I fill in:
      | element     | content            |
      | Street      | Blåsbackegatan 17  |
      | Zipcode     | 30247              |
      | Town        | Halmstad           |
    And I click the "Submit" button
    When I am on the restaurant page for "Awesome"
    And I should see "Blåsbackegatan 17"
    Then "Awesome" should have lat "56.6755" and long "12.8783"

  Scenario: I should be the only one who can edit my restaurant
    Given the following users exist
      | name  | email         | role  |
      | Anna  | anna@food.se  | owner |
      | Janne | janne@food.se | owner |
    And the following restaurants exists
      | name | description | town | owner |
      | MAC  | Nice food   | Home | Anna  |
    When I log in as "Janne"
    And I visit the restaurant page for "Anna"
    And I click the link "Edit"
    Then I should see "You are not authorized to access this page."
