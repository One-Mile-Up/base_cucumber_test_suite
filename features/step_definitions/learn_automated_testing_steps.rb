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
  find('.btn_action').click
end

Then("I see the homepage") do
  have_selector('div.inventory_list')
end

# Given(/^I am logged in with user "(.*?)" and the cart is empty$/) do |user|
#   find('[data-test="username"]').send_keys(user)
#   find('[data-test="password"]').send_keys('secret_sauce')
#   find('.btn_action').click
#   have_selector('div.inventory_list')
# end

# When(/^I click to add the item I want$/) do
#   click_on(class: 'btn_primary')
# end

# Then("I see number of items in the shopping cart increment up by 1") do
  
# end

# Given(/^I have an item in my shopping cart$/) do
#   click_button('ADD TO CART')
#   binding.pry
# end

# When(/^I click on the remove button$/) do
  
# end

# Then("I see the number of items in the cart decrease by 1") do
  
# end

Given(/^I log into the products page with user "(.*?)"$/) do |user|
  find('[data-test="username"]').send_keys(user)
  find('[data-test="password"]').send_keys('secret_sauce')
  find('.btn_action').click
  have_selector('div.inventory_list')
end

When(/^I click on the shopping cart$/) do
  click_on(class: 'shopping_cart_link')
end

Then("I can see the items I have selected") do
  have_selector('div#cart_contents_container')
end

Given(/^I login with user "(.*?)" and enter the shopping cart$/) do |user|
  find('[data-test="username"]').send_keys(user)
  find('[data-test="password"]').send_keys('secret_sauce')
  find('.btn_action').click
  have_selector('div.inventory_list')
  click_on(class: 'shopping_cart_link')
end

When(/^I click the Continue Shopping link$/) do
  click_on(class: 'btn_secondary')
end

Then("I am returned to the products page") do
  have_selector('div.inventory_list')
end

Given(/^I log into the products page with user "(.*?)"$/) do |user|
  find('[data-test="username"]').send_keys(user)
  find('[data-test="password"]').send_keys('secret_sauce')
  find('.btn_action').click
  have_selector('div.inventory_list')
end

When(/^I click on the hamburger menu and then on the About prompt$/) do
  click_on(class: 'btn_secondary')
end

Then("I see the Sauce Labs home page") do
  have_selector('div.inventory_list')
end