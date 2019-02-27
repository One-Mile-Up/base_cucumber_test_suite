Given(/^I am on the landing page$/) do
  expect(page.title).to eq('Swag Labs') 
  page.has_selector?("#login_button_container")
end

Then(/^I see the text "(.*?)"$/) do |text|
  page.has_text?(text)
end
