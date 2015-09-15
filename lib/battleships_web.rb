require 'sinatra/base'

class Battle_ship_september < Sinatra::Base

set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_player
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
