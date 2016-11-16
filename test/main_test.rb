ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift File.dirname(".")
require 'minitest/autorun'
require 'rack/test'

require 'main'

include Rack::Test::Methods


def app
  Main
end

describe "/ - heath check url" do
  it "should successfully return a greeting" do
    get '/'
    last_response.body.must_include 'Benjamin Kanouse'
    last_response.body.must_include 'Hello World'
    last_response.body.must_include 'Portfolio'
    last_response.body.must_include 'Contact'
  end
end
