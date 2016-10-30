require 'capybara/rspec'
require 'rubygems'
require 'bundler/setup'
require 'selenium-webdriver'
# require './spec/features/search_spec.rb'
require 'pry'

Capybara.default_driver = :selenium
Capybara.app_host = 'https://mdlqa3-www.mdlive.com/'
Capybara.run_server = false

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
  )
end


def wait_for_content(content, seconds)
  for i in 0..seconds
    if !has_content?(content, wait: seconds)
      puts "Waiting content '#{content}' to appear #{i} seconds"
      pause_for 1
    else
      puts "It took #{i} seconds to find '#{content}'"
      return true
    end
  end
  false
end