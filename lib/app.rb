require 'sinatra/base'
require_relative 'model'
class Rps < Sinatra::Base

  get ('/') do
    erb(:index)
  end

  post ('/1player') do
    erb(:oneplayer)
  end

  post ('/name1') do
    @player_1 = Player.create(params[:name])
    @rps = RockPaperScissors.create
    RockPaperScissors.instance.counter.reset_counter
    redirect ('/play1player')
  end

  get ('/play1player') do
    @name = Player.instance.name
    @game_count = RockPaperScissors.instance.counter.game_count
    @win_count = RockPaperScissors.instance.counter.win_count
    @lose_count = RockPaperScissors.instance.counter.lose_count
    @draw_count = RockPaperScissors.instance.counter.draw_count
    erb(:play1player)
  end

  post '/play' do
    @move = Game.create(params[:move], RockPaperScissors.new.move_generator)
    redirect ('/result1')
  end

  get ('/result1') do
    @name = Player.instance.name
    @chosen_move = Game.instance.move
    @cp_move = Game.instance.computer_move
    @winner = RockPaperScissors.instance.winner(@chosen_move, @cp_move)
    erb(:result1)
  end

  post ('/playagain1') do
    redirect ('/play1player')
  end

  post ('/2player') do
    erb(:twoplayer)
  end

  post ('/name2') do
    @player1 = Player.create(params[:player_1_name])
    @player2 = Player.create(params[:player_2_name])
    @switch = Switch.create(@player1.name, @player2.name)
    @rps = RockPaperScissors.create
    RockPaperScissors.instance.counter.reset_counter
    redirect ('/play2player')
  end

  get ('/play2player') do
    @name1 = Switch.instance.player_1
    @name2 = Switch.instance.player_2
    @current_player = Switch.instance.current_turn
    @game_count = RockPaperScissors.instance.counter.game_count
    @win_count = RockPaperScissors.instance.counter.win_count
    @lose_count = RockPaperScissors.instance.counter.lose_count
    @draw_count = RockPaperScissors.instance.counter.draw_count
    if @name1 == @current_player
      erb(:player1turn)
    else
      erb(:player2turn)
    end
  end

  post '/player1play' do
    Game.create(params[:move], "not selected")
    Switch.instance.switching_turns
    redirect ('/play2player')
  end

  post '/player2play' do
    Game.instance.computer_move = params[:move]
    redirect ('/result2')
  end

  get ('/result2') do
    @name1 = Switch.instance.players.first
    @name2 = Switch.instance.players.last
    @chosen_move = Game.instance.move
    @cp_move = Game.instance.computer_move
    @winner = RockPaperScissors.instance.winner(@chosen_move, @cp_move)
    erb(:result2)
  end

  post ('/playagain2') do
    Switch.instance.switching_turns
    redirect ('/play2player')
  end

  run! if app_file == $0
end
