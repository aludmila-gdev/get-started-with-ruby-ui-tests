require 'capybara'
require 'capybara/cucumber'
require 'report_builder'
require 'selenium/webdriver'

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions" => {
      args: %W[headless no-sandbox window-size=1200,800]
    }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.configure do |config|
  Capybara.default_driver = :headless_chrome
  config.default_max_wait_time = 10
end
