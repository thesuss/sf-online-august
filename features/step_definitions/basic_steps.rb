Given(/^I am on the "([^"]*)" page$/) do |page|
  expected_page = goto(page)
  visit expected_page
  expect(current_path).to eq expected_page
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:content]
  end
end

When(/^I click the link "([^"]*)"$/) do |link|
  click_link(link)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  expected_page = goto(page)
  expect(current_path).to eq expected_page
end

def goto(page)
  case page
  when 'restaurant'
    restaurant_path
  when 'menu'
    menu_path
  else
    root_path
  end
end
