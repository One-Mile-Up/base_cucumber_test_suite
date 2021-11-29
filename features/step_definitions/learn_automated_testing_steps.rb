Given(/^I navigate to the login page$/) do
  expect(page.title).to eq('Swag Labs') 
  page.has_selector?("#login_button_container")
end

Then(/^I submit user credentials$/) do
  # Fill in the username
  find('[data-test="username"]').send_keys(ENV['USERNAME'])
  # Fill in the password
  find('[data-test="password"]').send_keys(ENV['PASSWORD'])
  # Hit the login button
  find(:id, 'login-button').click
end

Then("I am on the homepage") do
  expect(find('.title').text).to eq('PRODUCTS')
end

Then(/^I see the inventory list contains (.*?) pictures$/) do |count|
  expect(find_all('.inventory_item').size).to eq(count.to_i)
end

When('I click on the shopping cart') do
  find('.shopping_cart_container').click
end

Then('I see it is currently empty') do
  # Find the cart list and make sure that nothing has been added (i.e. it's empty).
  expect(find('.cart_list').has_no_selector?('.cart_item')).to eq true
end

When('I navigate to the homepage') do
  visit('/inventory')
  binding.pry
end
