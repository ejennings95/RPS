require 'sinatra/base'
require_relative 'model'
class Rps < Sinatra::Base

  get ('/') do
    erb(:index)
  end

  post ('/name') do
    @player_1 = Player.create(params[:name])
    redirect ('/play')
  end

  get ('/play') do
    @name = Player.instance.name
    erb(:play)
  end

  post ('/play') do
    @move = Game.create(params[:move], RockPaperScissors.new.move_generator)
    redirect ('/result')
  end

  get ('/result') do
    @chosen_move = Game.instance.move
    @cp_move = Game.instance.computer_move
    erb(:result)
  end

  run! if app_file == $0
end
