Feature: As a restaurant Owner
  in order to present my restaurant
  I need to have a Restaurant Owner account.

  Scenario: I register as a Restaurant Owner
    Given there are "0" restaurant owners in the system
    And I am on the "index" page
    And I click the link "Register your restaurant account"
    Then I should see "Sign up as Owner"
    When I fill in:
      | element               | content                                         |
      | Name                  | Ahmad                                           |
      | Email                 | ahmad@random_restaurant.com                     |
      | Address               | Fjällgatan 3, Göteborg, Västa Götaland, Sverige |
      | Password              | password                                        |
      | Password confirmation | password                                        |
    When I click the "Register" button
    Then there should be "1" restaurant owner in the system
