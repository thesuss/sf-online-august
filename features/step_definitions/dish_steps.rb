Then(/^I should be on the dish page for "([^"]*)"$/) do |name|
  dish = Dish.find_by(dish_name: name)
  expect(current_path).to eq dish_path(dish)
end

When(/^I check the "([^"]*)" box$/) do |menu|
  page.check(menu)
end

When(/^visit the "([^"]*)" menu page$/) do |menu_name|
  menu = Menu.find_by(title: menu_name)
  visit menu_path(menu)
end
Given(/^I am on the dish page for "([^"]*)"$/) do |arg1|
  dish = Dish.find_by(dish_name: name)
  visit dish_path(dish)
end

Then(/^I should be on the edit dish page for "([^"]*)"$/) do |arg1|
  dish = Dish.find_by(dish_name: name)
  expect(current_path).to eq edit_dish_path(dish)
end
