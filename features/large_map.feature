Feature: As a Customer
  in order to see restaurants in my area
  I need to see a map and list with local restaurants.

Background:
  Given the following restaurant exist
  | name |
  | McD  |

@javascript
Scenario: Show map on index page
  When I am on the "index" page
  Then I should see a map-div
  And the map-div should contain a map

Scenario: Viewing my location on the map
  Given I am on the "index" page
  Then the page should know my location
  And the map should focus on my location
