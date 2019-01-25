require 'sinatra/base'

class Rps < Sinatra::Base

  get ('/') do
    erb(:index)
  end

  # post ('name') do 
  #

  run! if app_file == $0
end
