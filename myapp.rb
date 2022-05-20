require 'sinatra'

class Myapp < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end
end