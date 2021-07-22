require 'allure-cucumber'
require "capybara"
require "capybara/cucumber"
require 'webdrivers'
require 'faker'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "http://rocklov-web:3000"
    config_default_max_wait_time = 10
end

AllureCucumber.configure do |config|
    config.results_directory = "/logs"
    config.clean_results_directory = true
end