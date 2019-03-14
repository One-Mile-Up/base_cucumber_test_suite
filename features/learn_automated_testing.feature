Feature: Learn Automated Testing

  Scenario: I login to Swag Labs practice website
    Given   I am on the landing page
     When   I log into the application with user "standard_user"
     Then   I see the homepage 
    
  Scenario: I add an item to the shopping cart
    Given   I am logged in with user "standard_user" and the cart is empty
     When   I click to add the item I want
     Then   I see number of items in the shopping cart increment up by 1

  Scenario: I remove an item from the shopping cart
    Given   I have an item in my shopping cart
     When   I click on the remove button
     Then   I see the number of items in the cart decrease by 1

  Scenario: I visit the shopping cart
    Given   I log into the products page with user "standard_user"
     When   I click on the shopping cart
     Then   I can see the items I have selected

  Scenario: I resume shopping
    Given   I login with user "standard_user" and enter the shopping cart
     When   I click the Continue Shopping link
     Then   I am returned to the products page

  Scenario: I navigate to the About page
    Given   I log into the products page with user "standard_user"
     When   I click on the hamburger menu and then on the About prompt
     Then   I see the Sauce Labs home page

  Scenario: I log out of the Swag Labs practice website
    Given   I am logged in
     When   I click on the hamburger menu and click to log out
     Then   I see the login page
