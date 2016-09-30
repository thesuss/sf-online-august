Then(/^I should be on the dish page for "([^"]*)"$/) do |name|
  dish = Dish.find_by(dish_name: name)
  expect(current_path).to eq dish_path(dish)
end

When(/^select "([^"]*)" from "([^"]*)"$/) do |menu_name, field_name|
  page.check(menu_name)
  # within('#menus') do
  #   page.find('input[type=checkbox]').set(true)
  # end
end

When(/^visit the "([^"]*)" menu page$/) do |menu_name|
  menu = Menu.find_by(title: menu_name)
  visit menu_path(menu)
end
