Given(/^I am on the "([^"]*)" page$/) do |page|
  visit goto(page)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  expected_page = goto(page)
  expect(current_path).to eq expected_page
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:content]
  end
end

When(/^I fill in:$/) do |table|
  table.hashes.each do |hash|
      fill_in hash[:element], with: hash[:content]
  end
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button button
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

When(/^I click the link "([^"]*)"$/) do |link|
  click_link(link)
end

Then(/^I should see "([^"]*)" button$/) do |button|
  expect(page).to have_button button
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end

private

def goto(page)
  case page
  when 'restaurant'
    restaurant_path
  when 'menu'
    menus_path
  when 'add menu'
    new_menu_path
  when 'Create Dish'
    new_dish_path
  when 'register'
    new_user_registration_path
  when 'user registration'
    user_registration_path
  else
    root_path
  end
end
