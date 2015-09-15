require 'sinatra/base'

class battle_ship_september < Sinatra::Base
  get '/' do
    'Hello battle_ship_september!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
