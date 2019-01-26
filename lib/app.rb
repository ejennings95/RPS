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
    p @chosen_move
    erb(:play)
  end

  post ('/play') do
    @move = Game.create(params[:move])
    redirect ('/result')
  end

  get ('/result') do
    @chosen_move = Game.instance.move
    erb(:result)
  end

  run! if app_file == $0
end
