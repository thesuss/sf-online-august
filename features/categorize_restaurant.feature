Feature: As a restaurant Owner
  in order to categorize my food
  I need to be able to select a Restaurant category

  Background:
    Given I am logged in as a restaurant owner

  Scenario: I categorize a Restaurant
    Given I am on the "create restaurant" page
    Then I select "Pizza" from "Category"

  Scenario: I change the category of my restaurant
    Given I already have a restaurant
    And I am on the edit restaurant page for "Awesome restaurant"
    Then I select "Thai" from "Category"
    When I click the "Submit" button
    Then I should be on the restaurant page for "Awesome restaurant"
    And I should see "Thai"

  Scenario: I leave category blank
    Given I already have a restaurant
    And I am on the edit restaurant page for "Awesome restaurant"
    And I click the "Submit" button
    Then I should be on the restaurant page for "Awesome restaurant"
    And I should see "Other"
