require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  erb :index, :locals => {:number => SECRET_NUMBER}
end
