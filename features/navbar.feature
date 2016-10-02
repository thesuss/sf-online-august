Feature: As a visitor to the site
  In order to easily navigate through the site
  I should see a nav-bar with links

Scenario: Viewing the Menu page
  Given I am on the "index" page
  Then I should see:
    | content     |
    | Restaurants |
    | Link 2      |
  When I click the link "Restaurants"
  Then I should be on the "restaurant" page
