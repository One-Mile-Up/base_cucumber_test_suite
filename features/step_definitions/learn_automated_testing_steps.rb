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
  # binding.pry
  have_selector('div.inventory_list')
  expect(page.current_path).to eq('/inventory.html')
end

Given(/^I see the list of all items$/) do
  expect(find_all('.inventory_item_name').length).to eq(6)
end

When(/^I click on the link to the first item$/) do
  find_all('.inventory_item_name')[0].click
end

Then("I see that item's page") do
  expect(page.current_url).to eq('https://www.saucedemo.com/inventory-item.html?id=4')
end

Given(/^I see the cart is empty$/) do
  find("#shopping_cart_container")
  # Make sure that nothing is in the cart currently
  expect(page.has_css?(".fa-layers-counter")).to eq(false)
end

When(/^I click to add the item I want$/) do
  find_all(".btn_primary")[0].click
end

Then("I see number of items in the shopping cart increment up by 1") do
  expect(find('.fa-layers-counter').text).to eq('1')
end

Given(/^I have 2 items in my shopping cart$/) do
  find_all(".btn_primary")[0].click
  find_all(".btn_primary")[1].click
  expect(find('.fa-layers-counter').text).to eq('2')
end

When(/^I click on the remove button$/) do
  find_all(".btn_secondary")[0].click
end

Then("I see the number of items in the cart decrease by 1") do
  expect(find('.fa-layers-counter').text).to eq('1')
end

Given(/^I select items to add to the shopping cart$/) do
  find_all(".btn_primary")[2].click
  find_all(".btn_primary")[3].click
  expect(find('.fa-layers-counter').text).to eq('2')
end

When(/^I click on the shopping cart$/) do
  click_on(class: 'shopping_cart_link')
  expect(page.current_path).to eq('/cart.html')
end

Then("I can see the items I have selected") do
  expect(find_all('.cart_item').length).to eq(2)
end

Given(/^I add items to the shopping cart and enter the shopping cart$/) do
  find_all(".btn_primary")[4].click
  find_all(".btn_primary")[1].click
  expect(find('.fa-layers-counter').text).to eq('2')
  click_on(class: 'shopping_cart_link')
end

When(/^I click on the remove button for a specific item$/) do
  expect(find_all('.inventory_item_name').length).to eq(2)
  expect(find_all('.inventory_item_name')[0].text).to eq('Sauce Labs Onesie')
  expect(find_all('.inventory_item_name')[1].text).to eq('Sauce Labs Bike Light')
  find_all('.btn_secondary')[1].click
end

Then('I see the items in my shopping cart decrease by the one I clicked') do
  expect(find_all('.inventory_item_name').length).to eq(1)
  expect(find_all('.inventory_item_name')[0].text).to eq('Sauce Labs Onesie')
end

Given(/^I enter the shopping cart$/) do
  click_on(class: 'shopping_cart_link')
  expect(page.current_path).to eq('/cart.html')
end

When(/^I click the Continue Shopping link$/) do
  click_on(class: 'btn_secondary')
end

Then("I am returned to the products page") do
  have_selector('div.inventory_list')
  expect(page.current_path).to eq('/inventory.html')
end

Given(/^Items are sorted A-Z by default$/) do
  expect(find_all('.inventory_item_name').length).to eq(6)
  expect(find_all('.inventory_item_name')[0].text).to eq('Sauce Labs Backpack')
  expect(find_all('.inventory_item_name')[5].text).to eq('Test.allTheThings() T-Shirt (Red)')
end

When(/^I click the filter to sort Z-A$/) do
  page.select 'Name (Z to A)'
end

Then("Items are sorted in Z-A order") do
  expect(find_all('.inventory_item_name').length).to eq(6)
  expect(find_all('.inventory_item_name')[0].text).to eq('Test.allTheThings() T-Shirt (Red)')
  expect(find_all('.inventory_item_name')[5].text).to eq('Sauce Labs Backpack')
end

Given(/^Items not sorted by price low to high by default$/) do
  expect(find_all('.inventory_item_price').length).to eq(6)
  expect(find_all('.inventory_item_price')[0].text).to eq('$29.99')
  expect(find_all('.inventory_item_price')[5].text).to eq('$15.99')
end

When(/^I click the filter to sort by Price low to high$/) do
  page.select 'Price (low to high)'
end

Then("Items are sorted in low to high price order") do
  expect(find_all('.inventory_item_price').length).to eq(6)
  expect(find_all('.inventory_item_price')[0].text).to eq('$7.99')
  expect(find_all('.inventory_item_price')[5].text).to eq('$49.99')
end

Given(/^Items not sorted by price high to low by default$/) do
  expect(find_all('.inventory_item_price').length).to eq(6)
  expect(find_all('.inventory_item_price')[0].text).to eq('$29.99')
  expect(find_all('.inventory_item_price')[5].text).to eq('$15.99')
end

When(/^I click the filter to sort by Price high to low$/) do
  page.select 'Price (high to low)'
end

Then("Items are sorted in high to low price order") do
  expect(find_all('.inventory_item_price').length).to eq(6)
  expect(find_all('.inventory_item_price')[0].text).to eq('$49.99')
  expect(find_all('.inventory_item_price')[5].text).to eq('$7.99')
end

Given(/^The sidebar menu is not open$/) do
  expect(page).not_to have_selector('.bm-overlay')
end

When(/^I click on the hamburger menu button$/) do
  find('.bm-burger-button').click
end

Then("I see the sidebar menu is open") do
  expect(page).to have_selector('.bm-overlay')
end

Given(/^I open the hamburger menu$/) do
  find(".bm-burger-button").click
end

When(/^I click on the About prompt$/) do
  find('#about_sidebar_link').click
end

Then("I see the Sauce Labs home page") do
  expect(page.current_url).to eq('https://saucelabs.com/')
end

Given(/^I click on the hamburger menu$/) do
  find(".bm-burger-button").click
end
  
When(/^I click to log out$/) do
  find('#logout_sidebar_link').click
end
  
Then("I see the login page") do
  expect(page.title).to eq('Swag Labs') 
  page.has_selector?("#login_button_container")
end