require 'sinatra/base'

class Main < Sinatra::Base
  get '/' do
    erb :index
  end
end
