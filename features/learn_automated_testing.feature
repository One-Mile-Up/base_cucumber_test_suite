Feature: Learn Automated Testing
  Background: Log into application
    Given   I am on the landing page
     When   I log into the application with user "standard_user" 
     Then   I see the homepage 

  Scenario: I visit the item page for a specific item
    Given   I see the list of all items
     When   I click on the link to the first item
     Then   I see that item's page

  Scenario: I can add an item to the cart from it's specific item page
    Given   I navigate to the first item's specific item page
     When   I click to add it to the cart
     Then   The cart is incremented up by 1

  Scenario: I can remove an item from the cart from it's specific item page
    Given   I navigate to the first item's specific item page and add it to the cart
     When   I click the Remove button
     Then   I see the cart contents empty

  Scenario: I move back to the main page from the specific item page
    Given   I move to the item page for the first item
     When   I click Back button
     Then   I am back on the home page
    
  Scenario: I add an item to the shopping cart from the main page
    Given   I see the cart is empty
     When   I click to add the item I want
     Then   I see number of items in the shopping cart increment up by 1

  Scenario: I remove an item from the shopping cart
    Given   I have 2 items in my shopping cart
     When   I click on the Remove button
     Then   I see the number of items in the cart decrease by 1

  Scenario: I visit the shopping cart
    Given   I select items to add to the shopping cart
     When   I click on the shopping cart
     Then   I can see the items I have selected

  Scenario: I remove an item from my cart in the Shopping Cart screen
    Given   I add items to the shopping cart and enter the shopping cart
     When   I click on the remove button for a specific item
     Then   I see the items in my shopping cart decrease by the one I clicked

  Scenario: I resume shopping
    Given   I enter the shopping cart
     When   I click the Continue Shopping link
     Then   I am returned to the products page

  Scenario: I sort items using Z-A filter
    Given   Items are sorted A-Z by default
     When   I click the filter to sort Z-A
     Then   Items are sorted in Z-A order

  Scenario: I sort items using Price (low to high) filter
    Given   Items not sorted by price low to high by default
     When   I click the filter to sort by Price low to high
     Then   Items are sorted in low to high price order

  Scenario: I sort items using Price (high to low) filter
    Given   Items not sorted by price high to low by default
     When   I click the filter to sort by Price high to low
     Then   Items are sorted in high to low price order

  Scenario: I visit the sidebar menu
    Given   The sidebar menu is not open
     When   I click on the hamburger menu button
     Then   I see the sidebar menu is open

  Scenario: I navigate to the About page
    Given   I open the hamburger menu
     When   I click on the About prompt
     Then   I see the Sauce Labs home page

  Scenario: I log out of the Swag Labs practice website
    Given   I click on the hamburger menu
     When   I click to log out
     Then   I see the login page
