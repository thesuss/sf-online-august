Feature: As a visitor to the site
  In order to easily navigate through the site
  I should see a nav-bar with links

Scenario: Viewing the cart page
  Given I am on the "index" page
  Then I should see:
    | content     |
    | Home        |
    | Show cart   |
  When I click the link "Show cart"
  Then I should be on the "cart" page
