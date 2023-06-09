ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "selenium-webdriver"


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Devise test helpers
  include Warden::Test::Helpers
  Warden.test_mode!


  # Add more helper methods to be used by all tests here...
end

Capybara.register_driver :headless_chrome do
  options = Selenium::WebDriver::Chrome::Options.new(args:
    %w[
      disable-infobars
      disable-popup-blocking
      no-sandbox
      headless
      disable-dev-shm-usage
      disable-extensions
      disable-gpu
      window-size-1400,900
      ])
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Folder path for screenshots
Capybara.save_path = Rails.root.join("tmp/capybara")
Capybara.javascript_driver = :headless_chrome
