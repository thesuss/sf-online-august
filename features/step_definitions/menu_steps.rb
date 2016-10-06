Given(/^I create a menu "([^"]*)"$/) do |menu_name|
  steps %Q{
    Given I am on the "add menu" page
    When I fill in "title" with "#{menu_name}"
    And I click the "create" button
  }
end

Then(/^I should be on the menu page for "([^"]*)"$/) do |title|
  menu_id = Menu.find_by(title: title)
  expect(current_path).to eq menu_path(menu_id)
end

Given(/^I have the following menus:$/) do |table|
  owner = User.owners.first
  table.hashes.each do |menu|
    FactoryGirl.create(:menu, title: menu[:title], restaurant: owner.restaurant)
  end

end

Given(/^I am on the edit menu page for "([^"]*)"$/) do |menu_name|
  @menu = Menu.find_by(title: menu_name)
  visit edit_menu_path(@menu)
end

Given(/^I add "([^"]*)" to the "([^"]*)" menu$/) do |dish, menu|
  menu_page = Menu.find_by(title: menu)
  visit(edit_menu_path(menu_page))
  steps %Q{
    When I check the "#{dish}" box
    And I click the "Update" button
  }
end

Given(/^I am on the menu page for "([^"]*)"$/) do |menu_name|
  menu_page = Menu.find_by(title: menu_name)
  visit(menu_path(menu_page))
end

Given(/^"([^"]*)" has a menu "([^"]*)"$/) do |owner_name, menu_name|
  owner = User.find_by(name: owner_name).restaurant
  FactoryGirl.create(:menu, restaurant: owner, title: menu_name)
end

When(/^I check the "([^"]*)" box$/) do |menu|
  page.check(menu)
end

When(/^visit the "([^"]*)" menu page$/) do |menu_name|
  menu = Menu.find_by(title: menu_name)
  visit menu_path(menu)
end
