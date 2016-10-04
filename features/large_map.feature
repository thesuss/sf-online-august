Feature: As a Customer
  in order to see restaurants in my area
  I need to see a map and list with local restaurants.

Background:
  Given the following users exist
  | name   | email         | role  |
  | Anna   | anna@food.se  | owner |
  | Janne  | janne@food.se | owner |
  And "Anna" owns the following restaurant
  | name | description | town |
  | McD  | Nice food   | Home |
  And "Janne" owns the following restaurant
  | name | description | town |
  | McF  | Nice food   | Gone |
  And I am on the "index" page


@javascript
Scenario: Show map on index page
  Then I see a map-div
  And the map-div should contain a map

@javascript
Scenario: Viewing my location on the map
  And my location is "Gothenburg"
  Then I expect a Google map to load

Scenario: Listing restaurants on index
  Then I should see:
  | content   |
  | McD       |
  | Nice food |
  | Home      |
  | McF       |
  | Gone      |
  When I click the link "McD"
  Then I should be on the restaurant page for "McD"
