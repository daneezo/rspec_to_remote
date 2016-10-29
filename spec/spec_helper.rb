require 'capybara/rspec'
require 'rubygems'
require 'bundler/setup'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Capybara.app_host = 'https://stage.mdlive.com/'
Capybara.run_server = false

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
  )
end