Feature: As a visitor to the site
  In order to easily navigate through the site
  I should see a nav-bar with links

Scenario: Viewing the Menu page
  Given I am on the "index" page
  Then I should see:
    | content    |
    | Link 1     |
    | Link 2     |
And when I click "Link 1" link
Then I should be redirected to "restaurant" page
