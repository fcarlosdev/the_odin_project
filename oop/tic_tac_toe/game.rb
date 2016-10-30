# $LOAD_PATH << '.'
require './player.rb'
require './board.rb'

class Game

  attr_accessor :board, :current_player, :players

  def initialize(board)
    @board = board
    @players ||= {}
    @winner = nil
    @wrong_move = false
  end

  def start_game
    create_players
    choose_a_player
    loop do
      make_a_play
      break if game_over?
      change_player
    end
    finalize_game
  end

  def create_players
    @players = {"X" => Player.new("X","Player_X"),
                "0" => Player.new("0","Player_0")}
  end

  def choose_a_player
    choosed_player = ""
    while (!types_of_players.include?choosed_player)
      print "Choose a type of player(X or 0) : "
      choosed_player = gets.chomp.upcase
      puts "Wrong type of player, try again."
    end
    @current_player = @players[choosed_player]
  end

  def make_a_play
     clear_screen
     draw_board
     mov_of_player = @current_player.make_a_play
     @wrong_move = @board.fill_cell(mov_of_player,@current_player.type)
  end

  def game_over?
    @board.has_a_winner?(@current_player.type) || @board.filled_out?
  end

  def display_message
    puts (@board.has_a_winner?(@current_player.type)) ? "Player #{@current_player.type} has won!!!!" : "No winner."
  end

  def draw_board
    puts @board.draw_board
  end

 def change_player
   if @wrong_move.eql?true
     type = types_of_players.find {|t| t != @current_player.type}
     @current_player = @players.fetch(type)
   end
 end

 def types_of_players
   ["X", "0"]
 end

 def clear_screen
   system("clear")
 end

 def finalize_game
   clear_screen
   draw_board
   display_message
 end

end
