require './caesar_cipher_web/lib/caesar_cipher'
require 'sinatra'
require 'sinatra/reloader' if development?
# require './hangman_web/lib/'

configure do
  enable :sessions
  set :session_secret, "secret"
end

get "/" do
  erb :index
end

get "/caesar_cipher" do
  if !params["text"].nil? && !params["shift_by"].nil?
    ciphered_text = cipher(params["text"], 1)
  else
    ciphered_text = ""
  end
  erb :index, :locals => {result: ciphered_text}
end
