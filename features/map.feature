Feature: As a restaurant Owner
  in order to be found
  my restaurant need to be placed on a map.

Background:
  Given the following restaurant exist
  | name |
  | McD  |

Scenario: Show map on restaurant page
  Given I am on restaurant page for "McD"
  Then I should see "google map"
