require 'bundler/setup'
require 'capybara/cucumber'
require 'dotenv'
require 'pry'
require 'rspec/expectations'
require 'rubygems'
require 'selenium-webdriver'
require 'webdrivers'

Dotenv.load

SERVER_URL  ||= ENV['SERVER_URL']
WEB_BROWSER ||= (ENV['WEB_BROWSER'].downcase.to_sym)

# Local development
Capybara.register_driver(WEB_BROWSER) do |app|
  case WEB_BROWSER
  when :firefox
    Capybara::Selenium::Driver.new(app, browser: WEB_BROWSER)

  when :safari
    Capybara::Selenium::Driver.new(app, browser: WEB_BROWSER)

  when :headless_chrome
    options = Selenium::WebDriver::Chrome::Options.new(:exclude_switches => ['enable-automation']) # Disables the info-bar "Chrome is being controlled..."
    options.add_argument('--headless')
    # options.add_argument('--disable-gpu') # Needed in case of running on Windows.
    options.add_argument('--no-sandbox') # We aren't setting up a specific Chrome user.
    options.add_argument('--disable-dev-shm-usage') # If you launch a Docker container, by default, the /dev/shm partition will be 64 MB in size, too small to load.
    options.add_argument('--disable-infobars')

    Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)

  else :chrome
  options = Selenium::WebDriver::Chrome::Options.new(:exclude_switches => ['enable-automation']) # Disables the info-bar "Chrome is being controlled..."
  options.add_preference('credentials_enable_service', false) # Disable save password prompt
  options.add_argument("--window-size=1920,1080") # Maximize browser window

  Capybara::Selenium::Driver.new(app, browser: WEB_BROWSER, capabilities: options)
  end
  # Enable this to see configured 'options'/'args' in the browser!
  # binding.pry
end

Capybara.configure do |config|
  config.default_driver = WEB_BROWSER
  config.app_host = SERVER_URL
end

# Hooks
Before do |scenario|
  visit SERVER_URL
end

After do |scenario|
end
