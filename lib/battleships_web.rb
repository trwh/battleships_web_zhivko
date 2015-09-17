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
    # @ship = Ship.new(3)
    # $board.place(@ship, :A3, :vertically)
    erb :new_player
  end

  get '/start_the_game' do
    # @board = Board.new(Cell
    if params[:coordinate].nil?
      erb :start_the_game
    else
      @coord = params[:coordinate].to_sym
      $board.shoot_at(@coord)
      erb :start_the_game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
