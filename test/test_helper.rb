ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift File.dirname(".")
require 'minitest/autorun'
require 'rack/test'
require 'main'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'capybara_minitest_spec'
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.server = :webrick
Capybara.app = Main
Capybara.default_driver = :chrome

class MiniTest::Spec
  include Capybara::DSL
end

class Capybara::Session
  def params
    Hash[*URI.parse(current_url).query.split(/\?|=|&/)]
  end
end
