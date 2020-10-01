Feature: Learn Automated Testing

  Background: I login to Swag Labs practice website
    Given  I navigate to the login page
    Then   I submit user credentials

  Scenario: Home page contents
    Given  I am on the homepage
    Then   I see the inventory list contains 6 pictures
    When   I click on the shopping cart
    Then   I see it is currently empty
    When   I navigate to the homepage
