Then(/^there (?:should be|are) "([^"]*)" (?:user|users) in the system$/) do |count|
  expect(User.count).to eq count.to_i
end


Given(/^I register as a user with username "([^"]*)" and email "([^"]*)"$/) do |name, email|
  steps %Q{
    And I am on the "register" page
    When I fill in:
      | element                    | content          |
      | Name                       | #{name}           |
      | Email                      | #{email} |
      | Address                    | Fjällgatan 3, Göteborg, Västa Götaland, Sverige |
      | Password                   | password         |
      | Password confirmation      | password         |
    When I click the "Register" button
  }
end

Given(/^I there register as a user with username "([^"]*)" and email "([^"]*)"$/) do |name, email|
  steps %Q{
    When I fill in:
      | element                    | content          |
      | Name                       | #{name}           |
      | Email                      | #{email} |
      | Address                    | Fjällgatan 3, Göteborg, Västa Götaland, Sverige |
      | Password                   | password         |
      | Password confirmation      | password         |
    And I click the "Register" button
  }
end

Given(/^I register as a user with address "([^"]*)"$/) do |address|
  steps %Q{
    And I am on the "register" page
    When I fill in:
      | element                    | content          |
      | Name                       | name           |
      | Email                      | email@random.com |
      | Address                    | #{address} |
      | Password                   | password         |
      | Password confirmation      | password         |
    When I click the "Register" button
  }
end
