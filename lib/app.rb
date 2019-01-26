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
    @rps = RockPaperScissors.create
    @game_count = RockPaperScissors.instance.counter.game_count
    @win_count = RockPaperScissors.instance.counter.win_count
    @lose_count = RockPaperScissors.instance.counter.lose_count
    @draw_count = RockPaperScissors.instance.counter.draw_count
    erb(:play)
  end

  post ('/play') do
    @move = Game.create(params[:move], RockPaperScissors.new.move_generator)
    redirect ('/result')
  end

  get ('/result') do
    @name = Player.instance.name
    @chosen_move = Game.instance.move
    @cp_move = Game.instance.computer_move
    @winner = RockPaperScissors.instance.winner(@chosen_move, @cp_move)
    erb(:result)
  end

  post ('/playagain') do
    redirect ('/play')
  end

  run! if app_file == $0
end
