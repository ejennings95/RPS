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

  run! if app_file == $0
end
