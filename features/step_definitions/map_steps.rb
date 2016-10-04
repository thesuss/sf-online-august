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
  expect(page).to have_css '#map'
end

Then(/^the map\-div should contain a map$/) do
  within('#map') do
    expect(page).to have_css '.gm-style'
  end
end

And(/^my location is "([^"]*)"$/) do |city|
  case city
    when 'Gothenburg' then
      lat, lng = 57.7088700, 11.9745600
    when 'Stockholm' then
      lat, lng = 59.3293230, 18.0685810
  end
  simulate_location(lat, lng)
end

When /^I expect a Google map to load$/ do
  loop until all(:css, '#map .gm-style').length == 1
  expect(page).to have_css '#map .gm-style'
end


def simulate_location(lat, lng)
  page.execute_script("GMaps.geolocate({
                  success: function (position) {
                    map.setCenter(#{lat}, #{lng})}
                    });")
end
