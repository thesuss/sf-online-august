Feature: As a Customer
  in order to see restaurants in my area
  I need to see a map and list with local restaurants.

  Background:
    Given the following users exist
      | name  | email         | role  |
      | Anna  | anna@food.se  | owner |
      | Janne | janne@food.se | owner |

    And the following restaurants exists
      | name | description | town | owner |
      | McD  | Nice food   | Home | Anna  |
      | McF  | Nice food   | Gone | Janne |

    And I am on the "index" page

  @javascript
  Scenario: Viewing my location on the map
    And my location is set to "57.7088700" lat and "11.9745600" lng
    And the map has been loaded
    Then I should see "2" markers
