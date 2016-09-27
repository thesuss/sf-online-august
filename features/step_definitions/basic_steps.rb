Given(/^I am on the "([^"]*)" page$/) do |page|
  visit '/restaurant'
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:content]
  end
end
