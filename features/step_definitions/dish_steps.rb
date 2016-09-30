Then(/^I should be on the dish page for "([^"]*)"$/) do |name|
  dish = Dish.find_by(dish_name: name)
  visit dish_path(dish)
end

When(/^select "([^"]*)" from "([^"]*)"$/) do |menu, field_name|
  # select(menu) from (field_name)
end

When(/^visit the "([^"]*)" menu page$/) do |menu_name|
  menu = Menu.find_by(title: menu_name)
  visit menu_path(menu)
end
