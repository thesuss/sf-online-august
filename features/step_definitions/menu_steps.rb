Given(/^I create a menu "([^"]*)"$/) do |menu_name|
  steps %Q{
    Given I am on the "add menu" page
    When I fill in "title" with "#{menu_name}"
    And I click the "create" button
  }
end

Then(/^I should be on the "([^"]*)" page for "([^"]*)"$/) do |page, title|
  menu_id = Menu.find_by(title: title)
  expect(current_path).to eq menu_path(menu_id)
end
