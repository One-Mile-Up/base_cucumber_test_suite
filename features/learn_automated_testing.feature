Feature: Learn Automated Testing

  Scenario: I login to Swag Labs practice website
    Given   I am on the landing page
     When   I log into the application with user "standard_user"
     Then   I see the homepage 
    
