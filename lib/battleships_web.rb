require 'sinatra/base'
require_relative 'board'

class Battle_ship_september < Sinatra::Base

set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_player
  end

  get '/start_the_game' do
    @board = Board.new(Cell)
    @ship = Ship.new(3)
    @board.place(@ship, :A3, :vertically)
    @result = @board.print_table
    erb :start_the_game
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
