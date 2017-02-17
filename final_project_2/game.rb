require './board.rb'
require './player.rb'

class Game

  attr_reader :board, :players, :current_player

  def initialize(board, players)
    @board   = board
    @players = players
    @current_player = set_current_player
  end

  def play
    loop do
      take_turn
      break if game_over?
      change_player
    end
  end

  private

  def take_turn
    clear_screen
    display_board
    if !move_piece
      puts "Invalid moviment."
    end
  end

  def game_over?
    true
  end

  def display_board(cells=nil)
    return (cells.nil? ) ? board.draw_board : board.draw_board(cells)
  end

  def move_piece
    print "Move the piece from: "
    from = current_player.move_one_piece
    print "Move the piece to:"
    to = current_player.move_one_piece
    board.move(from,to)
  end

  def set_current_player
    (players[0].piece_type == :white) ? players[0] : players[1]
  end

  def change_player
    current_player = players.select {|p| p if current_player != p }
  end

  def clear_screen
    system("clear")
  end

  def get_piece(from)
    board.get_piece(from)
  end

end

# system("clear")
# b = Board.new(Array.new(8){Array.new(8,"")})
# players = [Player.new("player1",:white), Player.new("player2",:black)]
#
# g = Game.new(b,players)
#
# g.play
