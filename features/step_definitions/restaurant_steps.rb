Then(/^I should be on the restaurant page for "([^"]*)"$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  expect(current_path).to eq restaurant_path(restaurant)
end

Given(/^I am on the restaurant page for "([^"]*)"$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  visit restaurant_path(restaurant)
end

Given(/^I am logged in as a restaurant owner$/) do
  user = FactoryGirl.create(:user, role: 'owner')
  login_as(user, scope: :user)
end

Given(/^I already have a restaurant$/) do
  steps %q{
    Given I am on the "create restaurant" page
    When I fill in:
      | element     | content              |
      | Name        | Awesome restaurant   |
      | Description | Good food            |
      | Street      | Holtermansgatan 17d  |
      | Zipcode     | 41235                |
      | Town        | Göteborg             |
    And I click the "Create" button
  }
end

When(/^I am on my restaurant page$/) do
  restaurant = Restaurant.first
  visit restaurant_path(restaurant)
end

Given(/^the following owners exist:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash.merge({role: 'owner'}))
  end
end

Given(/^"([^"]*)" has a restaurant$/) do |name|
  owner = User.find_by(name: name)
  FactoryGirl.create(:restaurant, user: owner)
end

When(/^I visit the restaurant page for "([^"]*)"$/) do |name|
  owner = User.find_by(name: name)
  restaurant = Restaurant.find_by(user: owner)
  visit restaurant_path(restaurant)
end

Given(/^I haven't set up my restaurant$/) do
  expect(Restaurant.first).to eq nil
end

Given(/^the following restaurants exists$/) do |table|
  table.hashes.each do |hash|
    user = User.find_by(name: hash[:owner])
    FactoryGirl.create(:restaurant, name: hash[:name],
                                    description: hash[:description],
                                    town: hash[:town],
                                    user: user)
  end
end

private
def set_user(name)
  @user = User.find_by(name: name)
end
