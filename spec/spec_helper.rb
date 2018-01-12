require 'selenium-webdriver'
require 'capybara'
require 'capybara/rspec'
require 'allure-rspec'
require 'logger'

Capybara.configure do |c|
  c.default_driver = :selenium_chrome_headless
  c.app_host = 'http://mark7.herokuapp.com'
end

AllureRSpec.configure do |c|
  c.output_dir = "log/reports" # default: gen/allure-results
  c.clean_dir = true # clean the output directory first? (default: true)
  c.logging_level = Logger::WARN # logging level (default: DEBUG)
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include AllureRSpec::Adaptor
  config.include Capybara::DSL

end

Capybara.default_max_wait_time = 10
