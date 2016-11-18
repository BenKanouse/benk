require 'sinatra/base'

class Main < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/guitar/1' do
    erb :guitar1
  end
end
