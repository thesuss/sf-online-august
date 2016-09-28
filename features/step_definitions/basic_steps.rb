Given(/^I am on the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
  expect(current_path).to eq @goto
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
  set_goto(page)
  expect(current_path).to eq @goto
end

def set_goto(page)
  case page
  when 'restaurant'
    @goto = '/restaurant'
  when 'menu'
    @goto = '/menu'
  else
    @goto = '/'
  end
end
