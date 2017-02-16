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
    board.draw_board

    from = move_piece_from
    to   = move_piece_to

    origin = PiecesUtil.position_to_axis(from)
    piece = board.cells[origin[0]][origin[1]]
    if (piece.move_to(to))
      system("clear")
      destiny = PiecesUtil.position_to_axis(to)
      board.cells[destiny[0]][destiny[1]] = piece
      board.cells[origin[0]][origin[1]] = ""
      board.draw_board(board.cells)
      true
    else
      puts "Invalid move of the #{piece.type} to #{to} position."
      false
    end

  end

  private

  def move_piece_from
    current_player.move_piece_from
  end

  def move_piece_to
    current_player.move_piece_to
  end

  def set_current_player
    (players[0].piece_type == :white) ? players[0] : players[1]
  end

  def change_player
    players.select {|p| p if current_player != p }
  end

end

system("clear")
b = Board.new(Array.new(8){Array.new(8,"")})
players = [Player.new("player1",:white), Player.new("player2",:black)]

g = Game.new(b,players)

g.play
