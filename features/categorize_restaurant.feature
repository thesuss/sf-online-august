Feature: As a restaurant Owner
  in order to categorize my food
  I need to be able to select a Restaurant category

  Background:
    Given I am logged in as a restaurant owner

Scenario: I categorize a Restaurant
  Given I am on the "create restaurant" page
  And show me the page
  Then I should be able to select "Pizza" from "Category"
