require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
@@status = ""
@@guesses = 5


get '/' do

  message = check_guess(params["guess"],params["cheat"])

  if @@guesses == 0 && @@status != :won
    message = "You lost the game, a new number was generated"
    @@guesses = 5
    SECRET_NUMBER = rand(100)
  elsif @@status == :won
    @@guesses = 5
    SECRET_NUMBER = rand(100)
  else
    @@guesses -= 1
  end
  bg_color = change_bg_color
  @@status = "" if @@status != :won || @@guesses == 0
  erb :index, :locals => {message: message, bg_color: bg_color}
end

def check_guess(guess,cheat)
  msg = ""
  if guess.nil?
    @@status = :started
    ""
  elsif guess.to_i > SECRET_NUMBER + 5
    @@status = :way_too_high
    msg = "Way too high!"
  elsif guess.to_i < SECRET_NUMBER - 5
    @@status = :way_too_low
    msg = "Way too low!"
  elsif guess.to_i > SECRET_NUMBER
    @@status = :too_hight
    msg = "Too high!"
  elsif guess.to_i < SECRET_NUMBER
    @@status = :too_low
    msg = "Too low!"
  elsif guess.to_i == SECRET_NUMBER
    @@status = :won
    msg = "You got it right!"
  end
  (msg + show_secret_number(cheat))
end

def change_bg_color
  case @@status
  when :started then "#FF0011"
  when :way_too_high then "#FF9473"
  when :way_too_low then "#FF9473"
  when :too_hight then "#FF0000"
  when :too_low then "#FF0000"
  when :won then "#00FF00"
  end
end

def show_secret_number(cheat)
  (!cheat.nil? && cheat == "true") ? "<br /> The SECRET_NUMBER is #{SECRET_NUMBER}" : ""
end
