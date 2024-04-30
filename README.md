# Overview

This is a base testing suite that is for learning how to apply automated testing methodologies.

## Contributing

PLEASE do...

### Tooling

I am trying my best to keep things as simple and bare-bones as possible here, therefore trying to keep folks from getting stuck in the weeds of setup, etc.

In this project we are currently using:

- Ruby
- Cucumber / Capybara / Rspec

### Setup

- Clone this repo
- From the base directory, on the command line:
  - run `bundle install` (make sure all dependencies are installed with no errors before moving on...)

### Run the tests

- From the base directory, run an entire feature file

   ```bash
   bundle exec cucumber features/learn_automated_testing.feature
   ```

- Run a specific Scenario ___within___ a feature file...

   ```bash
   bundle exec cucumber features/learn_automated_testing.feature:3
   ```

### Run the tests in Chrome ___headless___

- Open the `features/.env` file and make it look like this:

  ```bash
  # Local browser testing
  # WEB_BROWSER='chrome'
  # WEB_BROWSER='firefox'
  # WEB_BROWSER='safari'
   WEB_BROWSER='headless_chrome'
  ```

### Troubleshooting

#### Using Chromedriver with rbenv on a Mac

- If you have trouble connecting to Chromedriver and are using rbenv...
  - Remove Chromedriver rbenv shim found at:

     ```bash
     /Users/xxx/.rbenv/shims/chromedriver
     ```

  - Install Chromedriver. There are issues when attempting to user Homebrew to install Chromedriver. We recommend using this method since it installs Chromedriver directly from the source:

     ```bash
     curl http://chromedriver.storage.googleapis.com/2.38/chromedriver_mac64.zip -o chromedriver_mac64.zip
     unzip chromedriver_mac64.zip
     mv chromedriver /usr/local/bin
     chmod +x /usr/local/bin/chromedriver
     rm chromedriver_mac64.zip
     ```
  