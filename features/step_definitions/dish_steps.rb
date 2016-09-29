Then(/^I should be on the dish page for "([^"]*)"$/) do |name|
  dish = Dish.find_by(dish_name: name)
  visit dish_path(dish)
end
