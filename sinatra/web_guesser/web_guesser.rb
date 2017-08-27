require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  "The SECRET NUMBER is #{SECRET_NUMBER}"
end
