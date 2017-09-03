require 'sinatra'
require './hangman_web/lib/hangman'
require './caesar_cipher_web/lib/caesar_cipher'
require 'sinatra/reloader' if development?

configure do
  enable :sessions
  set :session_secret, "secret"
end

def setup_hagman_game
  session[:game] = nil
  session[:game] = Hangman.new
end

get "/" do
  setup_hagman_game
  erb :index
end

get "/caesar_cipher" do
  if !params["text"].nil? && !params["shift_by"].nil?
    ciphered_text = cipher(params["text"], 1)
  else
    ciphered_text = ""
  end
  erb :caesar_cipher, :locals => {result: ciphered_text}
end

get "/hangman_game" do
  @game = session[:game]
  letter = (params["letter"].nil?) ? "" : params["letter"]
  status = @game.check_letter(letter)
  wrong_guesses = @game.wrong_letters.join(",")

  erb :hangman_game, :locals => {
    secret_word: @game.secret_word,
    gallow: gallow_images(@game.guess_number),
    hidden_letters: @game.show_hidden_letters,
    game_status: status, wrong_letters:wrong_guesses}
end

get "/play_again" do
  setup_hagman_game
  redirect "/hangman_game"
end

helpers do

  def gallow_images(index)
    return "./hang_pics/hangman_0.png" if index == 0
    return "./hang_pics/hangman_1.png" if index == 1
    return "./hang_pics/hangman_2.png" if index == 2
    return "./hang_pics/hangman_3.png" if index == 3
    return "./hang_pics/hangman_4.png" if index == 4
    return "./hang_pics/hangman_5.png" if index == 5
    return "./hang_pics/hangman_6.png" if index == 6
  end

end
