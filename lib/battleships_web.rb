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
    session[:size] = 3
    @player = params[:name]
    erb :new_player
  end

  get '/start_the_game' do
    @failed = false

    if params[:coordinate].nil?
      erb :start_the_game
    else
      coord = params[:coordinate].to_sym
      ship = Ship.new(session[:size])
      begin
        $board.place(ship, coord, :horizontally)
      rescue
        @failed = true
      else
        session[:size] += 1
      end
      erb :start_the_game
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
