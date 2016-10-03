Then(/^there (?:should be|are) "([^"]*)" (?:user|users) in the system$/) do |count|
  expect(User.customers.count).to eq count.to_i
end

Then(/^there (?:should be|are) "([^"]*)" restaurant (?:owner|owners) in the system$/) do |count|
  expect(User.owners.count).to eq count.to_i
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

Given(/^I am logged in as a user$/) do
  user = FactoryGirl.create(:user, role: 'customer')
  login_as(user, scope: :user)
end

Given(/^I am logged in as a restaurant owner$/) do
  user = FactoryGirl.create(:user, role: 'owner')
  login_as(user, scope: :user)
end

Given(/^I am not logged in$/) do
  logout
end
