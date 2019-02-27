require 'bundler/setup'
require 'capybara/cucumber'
require 'dotenv'
require 'pry'
require 'rspec/expectations'
require 'rubygems'
require 'selenium-webdriver'

Dotenv.load

SERVER_URL  ||= ENV['SERVER_URL']
WEB_BROWSER ||= (ENV['WEB_BROWSER'].downcase.to_sym)

# Local development
Capybara.register_driver WEB_BROWSER do |app| 
  case WEB_BROWSER
  when :chrome
    prefs = {
      prompt_for_download: false,
      credentials_enable_service: false 
    }

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_preference(:download, prefs)
    options.add_argument("disable-infobars")

  Capybara::Selenium::Driver.new(app, browser: WEB_BROWSER, options: options)

  when :firefox
    additional_prefs = Selenium::WebDriver::Firefox::Profile.new
    additional_prefs.native_events = true
    additional_prefs['browser.download.dir'] = "/tmp/webdriver-downloads"
    additional_prefs['browser.download.folderList'] = 2
    additional_prefs['browser.helperApps.neverAsk.saveToDisk'] = "application/pdf"
    additional_prefs['browser.cache.disk.enable'] = false
    additional_prefs['browser.cache.memory.enable'] = false
    additional_prefs['browser.fixup.alternate.enabled'] = false
    additional_prefs['network.http.use-cache'] = false
    additional_prefs['geo.enabled'] = true
    additional_prefs['geo.prompt.testing'] = true
    additional_prefs['geo.prompt.testing.allow'] = true
    additional_prefs['geo.wifi.uri'] = "file:///tmp/geolocation/geolocation.json"
    additional_prefs['pdfjs.disabled'] = true
    
    Capybara::Selenium::Driver.new(app, browser: WEB_BROWSER, options: additional_prefs)
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
