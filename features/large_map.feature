Feature: As a Customer
  in order to see restaurants in my area
  I need to see a map and list with local restaurants.

Background:
  Given the following restaurant exist
  | name | description | town |
  | McD  | Nice food   | Home |
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
