require "sinatra"
require_relative "db/models"

get '/' do
  @fishes = Fish.all
  erb :index, layout: :main
end

get '/:fish_name' do
  @fish = Fish.find_by(name: params[:fish_name])
  erb :show, layout: :main
end
