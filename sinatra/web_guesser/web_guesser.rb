require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
@@status = ""

get '/' do
  message = check_guess(params["guess"])
  erb :index, :locals => {message: message}
end

def check_guess(guess)
  if guess.nil?
    @@status = :started
    ""
  elsif guess.to_i > SECRET_NUMBER + 5
    @@status = :way_too_high
    "Way too high!"
  elsif guess.to_i < SECRET_NUMBER - 5
    @@status = :way_too_low
    "Way too low!"
  elsif guess.to_i > SECRET_NUMBER
    @@status = :too_hight
    "Too high!"
  elsif guess.to_i < SECRET_NUMBER
    @@status = :too_low
    "Too low!"
  elsif guess.to_i == SECRET_NUMBER
    @@status = :won
    "You got it right!"
  end
end
