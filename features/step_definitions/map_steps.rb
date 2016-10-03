Given(/^the following restaurant exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant, hash)
  end
end

Given(/^I am on restaurant page for "([^"]*)"$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  visit restaurant_path(restaurant)
end

Then(/^"([^"]*)" should have a latitude$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  expect(restaurant.latitude).not_to be nil
end

Then(/^I should see a map-div$/) do
  loop until all(:css, '#map').length == 1
  expect(page).to have_css '#map'
end
