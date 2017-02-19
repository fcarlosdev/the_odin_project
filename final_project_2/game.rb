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
    end
  end

  def game_over?
    color = (current_player.color == "white") ? "black" : "white"
    king = board.get_king_color(color)
    king[0].color
  end

  private

  def take_turn
    clear_screen
    show_board
    if !move_piece(moves_of_player)
      puts "Invalid movement, try again."
    end
  end

  def move_piece(directions)
    board.move(directions[0],direction[1])
  end

  def moves_of_player
    print "Move the piece from of the position (Ex.:pf2): "
    from = current_player.move_piece
    print "Move to position (Ex.:pf3): "
    to = current_player.move_piece
    [from,to]
  end

  def display_board(cells=nil)
    return (cells.nil? ) ? board.draw_board : board.draw_board(cells)
  end

  def set_current_player
    (players[0].color == "white") ? players[0] : players[1]
  end

  def change_player
    current_player = players.select {|p| p if current_player != p }
  end

  def clear_screen
    system("clear")
  end

  def show_board
    board.draw_board
  end

end

# system("clear")
# b = Board.new(Array.new(8){Array.new(8,"")})
# players = [Player.new("player1",:white), Player.new("player2",:black)]
#
# g = Game.new(b,players)
#
# g.play
