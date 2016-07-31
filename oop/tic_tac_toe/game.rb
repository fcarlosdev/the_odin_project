$LOAD_PATH << '.'
require 'player.rb'
require 'board.rb'

class Game

  def initialize
    @board = Board.new
    @player_1 = nil
    @player_2 = nil
    @current_player = nil
  end

  def change_turn(type_player)
    @current_player = (type_player.eql?"X") ? @player_2 : @player_1
  end

  def start_game
    system("clear")
    puts "+=========================================+"
    puts "|               TIC TAC TOE               |"
    puts "+=========================================+"
    puts "|               INSTRUCTIONS              |"
    puts "| 1 - Choose a type of player (X / 0)     |"
    puts "| 2 - To make move, inform the place where|"
    puts "|     you want mark on the board          |"
    puts "| Example: To mark the first cell of board|"
    puts "|          type A0 and so on.             |"
    puts "| 3 - Wait to other player make the turn  |"
    puts "| 4 - Continue till there are a winner or |"
    puts "|     the board is filled.                |"
    puts "+-----------------------------------------+"

    choose_a_player
    @board.draw_board
    winner_found = false
    while !@board.filled_out? && !winner_found
      player_type = @current_player.type

      print "Make a move Player #{player_type}: "
      mov_player = gets.chomp.upcase.to_sym

      if @current_player.mark_cell(@board,mov_player,player_type) && !winner_found
        @board.draw_board
        winner_found = @board.has_a_win?
        change_turn(player_type) if winner_found == false
      end
    end
    puts "Player #{@current_player.type} has won!!!!" if winner_found
    puts "No winner." if winner_found == false
    puts
  end

  def choose_a_player
    choosed_player = ""
    while (!["X","0"].include?choosed_player)
      print "Choose a type of player(X or 0) : "
      choosed_player = gets.chomp.upcase
      puts "Wrong type of player, try again."
    end
    select_of(choosed_player)
  end

  def select_of(type_of_player)
    @player_1 = (type_of_player.eql?"X") ? Player.new("X") : Player.new("0")
    @player_2 = (@player_1.type == "X") ? Player.new("0") : Player.new("X")
    @current_player = @player_1
  end

end

game = Game.new
game.start_game
