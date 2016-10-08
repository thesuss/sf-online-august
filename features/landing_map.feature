@javascript
Feature: As a Customer
  in order to see restaurants in my area
  I need to see a map and list with local restaurants.

  Background:
    Given the following users exist
      | name  | email         | role  |
      | Anna  | anna@food.se  | owner |
      | Janne | janne@food.se | owner |

    And the following restaurants exists
      | name | description | zipcode | owner  | category |
      | McD  | Nice food   | 41463   | Anna   | Pizza    |
      | McF  | Nice food   | 41677   | Janne  | Pizza    |
      | Jam  | Jam  food   | 41509   | Henrik | Thai     |
    And I am on the "index" page

  Scenario: Viewing my location on the map
    Given my location is set to "57.7088700" lat and "11.9745600" lng
    And the map has been loaded
    # How could we test for the map actually centering on the user?

  Scenario: Viewing the restaurants on the map
    Given my location is set to "57.7088700" lat and "11.9745600" lng
    And the map has been loaded
    When I select "All Restaurants" from "category"
    And the map has been loaded
    Then I should see "3" markers

  Scenario: Viewing restaurants on the map by category
    When I select "Pizza" from "category"
    Then I should see "2" markers
