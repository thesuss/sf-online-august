Feature: Geocoding restaurants

Background:
  Given the following restaurant exist
  | name |
  | McD  |

Scenario: Show map on index page
  When I am on the "index" page
  Then I should see a map-div

Scenario: Geocode restaurant
  Given I am on restaurant page for "McD"
  Then "McD" should have a latitude
