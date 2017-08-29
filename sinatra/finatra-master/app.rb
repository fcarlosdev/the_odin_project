require "sinatra"

get '/' do
  erb :index, layout: :main
end

get '/:fish_name' do
  @fish = params[:fish_name]
  erb :show, layout: :main
end
