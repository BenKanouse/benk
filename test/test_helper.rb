ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift File.dirname(".")
require 'minitest/autorun'
require 'rack/test'
require 'main'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'capybara_minitest_spec'

Capybara.app = Main
Capybara.default_driver = :webkit

class MiniTest::Spec
  include Capybara::DSL
end

class Capybara::Session
  def params
    Hash[*URI.parse(current_url).query.split(/\?|=|&/)]
  end
end
