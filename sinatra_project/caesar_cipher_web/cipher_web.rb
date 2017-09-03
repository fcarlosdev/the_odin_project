require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/caesar_cipher'

get "/" do
  if !params["text"].nil? && !params["shift_by"].nil?
    ciphered_text = cipher(params["text"], 1)
  else
    ciphered_text = ""
  end
  erb :index, :locals => {result: ciphered_text}
end
