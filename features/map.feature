Feature: As a restaurant Owner
  in order to be found
  my restaurant need to be placed on a map.

Background:
  Given the following restaurant exist
  | name |
  | McD  |

Scenario: Show map on restaurant page
  Given I am on restaurant page for "McD"
  Then "McD" should have a latitude
  And I should see a map-div
