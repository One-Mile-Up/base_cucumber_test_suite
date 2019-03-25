Feature: Learn Automated Testing
  Background: Log into application
    Given   I am on the landing page
     When   I log into the application with user "standard_user" 
     Then   I see the homepage 
    
  Scenario: I add an item to the shopping cart
    Given   I see the cart is empty
     When   I click to add the item I want
     Then   I see number of items in the shopping cart increment up by 1

  Scenario: I remove an item from the shopping cart
    Given   I have an item in my shopping cart
     When   I click on the remove button
     Then   I see the number of items in the cart decrease by 1

  Scenario: I visit the shopping cart
    Given   I select items to add to the shopping cart
     When   I click on the shopping cart
     Then   I can see the items I have selected

  Scenario: I resume shopping
    Given   I enter the shopping cart
     When   I click the Continue Shopping link
     Then   I am returned to the products page

  Scenario: I navigate to the About page
    Given   I login with user "standard_user"
     When   I click on the hamburger menu and then on the About prompt
     Then   I see the Sauce Labs home page

  Scenario: I log out of the Swag Labs practice website
    Given   I log in with user "standard_user"
     When   I click on the hamburger menu and click to log out
     Then   I see the login page
