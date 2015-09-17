require 'sinatra/base'
require_relative 'board'

$board = Board.new(Cell)

class Battle_ship_september < Sinatra::Base

  enable :sessions

  set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_player
  end

  get '/start_the_game' do
    session[:size] = 3
    if params[:coordinate].nil?
      erb :start_the_game
    else
      coord = params[:coordinate].to_sym
      ship = Ship.new(session[:size])
      $board.place(ship, coord, :horizontally)
      erb :start_the_game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
