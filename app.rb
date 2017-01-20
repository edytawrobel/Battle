require 'sinatra/base'
require 'sinatra'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    Game.new(player_1, player_2)
    # $game = Game.new(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    @game = Game.game_instance
    erb :play
  end

  post '/attack' do
    @game = Game.game_instance
    @game.attack(@game.opponent_of(@game.turn))
    @game.switch_turn
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
