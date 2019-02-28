Given(/^I am on the landing page$/) do
  expect(page.title).to eq('Swag Labs') 
  page.has_selector?("#login_button_container")
end

When(/^I log into the application with user "(.*?)"$/) do |user|
  # Fill in the username
  find('[data-test="username"]').send_keys(user)
  # Fill in the password
  find('[data-test="password"]').send_keys('secret_sauce')
  # Hit the login button
  find('.login-button').click
end

Then("I see the homepage") do
  binding.pry
  pending # Write code here that turns the phrase above into concrete actions
end
