Feature: As a visitor to the site
  In order to easily navigate through the site
  I should see a nav-bar with relevant links

Scenario: Viewing the cart page
  Given I am not logged in
  And I am on the "index" page
  Then I should see:
    | content     |
    | Home        |
    | Show cart   |
  When I click the link "Show cart"
  Then I should be on the "cart" page


Scenario: Links to see as a visitor
  Given I am not logged in
  And I am on the "index" page
  Then I should see:
    | content     |
    | Home        |
    | Show cart   |
  And I should not see "Create a new restaurant"

Scenario: Links to see as a user
  Given I am logged in as a user
  And I am on the "index" page
  Then I should see:
    | content      |
    | Home         |
    | Your profile |
    | Show cart    |
  And I should not see "Create a new restaurant"

Scenario: Links to see as a restaurant owner
  Given I am logged in as a restaurant owner
  And I am on the "index" page
  Then I should see:
    | content                 |
    | Home                    |
    | Create a new restaurant |
    | Show your restaurant    |
  And I should not see "Show cart"
