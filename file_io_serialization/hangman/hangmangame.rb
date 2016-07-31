require 'yaml'

class Hangman

  attr_reader :secret_word, :hidden_letters

  def initialize
    setup_game
  end

  def get_words_from_file
    words = []
    File.open("5desk.txt", "r").each_line do |word|
      words.push(word.strip) if word.strip.length >= 5 && word.strip.length <= 12
    end
    words
  end

  def play
    system("clear")
    print %q{
      +******************************+
      |          Hangman Game        |
      +******************************+
      | 1 - New game                 |
      | 2 - Load a game              |
      | 3 - Exit                     |
      +*******************************
    }
    print "  Choose one option: "
    choose = gets.chomp.to_i
    if (choose.eql?1)
      new_game
    elsif choose.eql?2
      puts "Loading last game...".rjust(26)
      game_opened = open_game
      if game_opened == false
        print "No game found. Are you wish try other option?(y/n):".rjust(57)
        try_again = gets.chomp.downcase
        if try_again == "y"
          play
        elsif try_again == "n"
          exit
        end
      end
    elsif choose.eql?3
      puts "End of game"
      exit
    end
  end

  protected

  def new_game
    draw_current_game(@guess_number,"")
    play_game
  end

  def save_game
    game_serialized = YAML::dump(self)
    game_file = File.new("game_file.yaml","w+")
    game_file.write(game_serialized)
  end

  def open_game
    if File.exists?("game_file.yaml")
      saved_game = YAML::load(File.read("game_file.yaml"))
      saved_game.play_game
      return true
    else
      # puts "No game found."
      return false
    end
  end

  def play_game
    value_entered = ""
    draw_current_game(@guess_number,value_entered)
    you_won = false
    while (@guess_number < 6 && you_won == false)
      puts
      print "Enter 2 to save, 3 to exit from game or one letter to continue: ".rjust(68)
      value_entered = gets.chomp.downcase
      if value_entered == "2"
          puts "Saving game...".rjust(18)
          save_game
          setup_game
          play
      elsif value_entered == "3"
        setup_game
        play
        break
      end
      @guess_number += 1 if !@secret_word.include?(value_entered)
      draw_current_game(@guess_number,value_entered)
      # puts "Secret word = #{@secret_word}"
      you_won = @hidden_letters.join("") == @secret_word
    end
    check_game(you_won)
  end

  def check_game(status)
    if status
      puts
      puts "*****************************************".rjust(50)
      puts "*************** YOU WON *****************".rjust(50)
      puts "*****************************************".rjust(50)
    else
      puts
      puts "*****************************************".rjust(50)
      puts "*************** GAME OVER ***************".rjust(50)
      puts "*****************************************".rjust(50)
      puts "Secret word = #{@secret_word}".rjust(32)
    end
    print "New game ? (y/n): "
    if gets.chomp.downcase == "y"
      you_won = false
      setup_game
      new_game
    else
      play
    end
  end

  def setup_game
    @words = get_words_from_file
    @secret_word = @words.sample.downcase
    @hidden_letters = []
    @wrong_letters = []
    @guess_number = 0
 end

 def draw_current_game(guess_number,letter)
   system("clear")
   draw_guallow(guess_number)
   draw_hidden_latters(letter)
   puts "   #{@hidden_letters.join(" ")}"
   puts "    Wrong Letters: #{@wrong_letters.join(" ")}"
 end

 def draw_guallow(guess_number)
    pictures = [
      %q{
      _________
      |        |
      |
      |
      |
      |
    __|__},
    %q{
      _________
      |        |
      |        0
      |
      |
      |
    __|__},
    %q{
      _________
      |        |
      |        0
      |        |
      |
      |
    __|__},
    %q{
      _________
      |        |
      |        0
      |       /|
      |
      |
    __|__},
    %q{
      _________
      |        |
      |        0
      |       /|\
      |
      |
    __|__},
    %q{
      _________
      |        |
      |        0
      |       /|\
      |       /
      |
    __|__},
    %q{
      _________
      |        |
      |        0
      |       /|\
      |       / \
      |
    __|__}]
    system("clear")
    print pictures[guess_number]
  end

  def draw_hidden_latters(entered_letter)
    if @secret_word.include?(entered_letter)
      for index in 0..@secret_word.length-1 do
        if @secret_word[index] != entered_letter && @hidden_letters[index] == nil
          @hidden_letters[index] = "_"
        elsif @secret_word[index] == entered_letter
          @hidden_letters[index] = entered_letter
        end
      end
    else
      @wrong_letters.push(entered_letter) if !@wrong_letters.include?(entered_letter)
    end
  end
end

game = Hangman.new
game.play
