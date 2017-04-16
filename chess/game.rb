require "./board.rb"
require "./player.rb"
require "./modules/pieces.rb"

class Game

  include Pieces

  attr_reader :board, :players, :current_player

  def initialize(board, players)
    @board = board
    @players = players
    @current_player = nil
  end

  def move_piece(from,to)
    piece = board.get_piece(from)
    if valid_move?(piece,from,to)
      update_board(map_to_axis(from),map_to_axis(to),piece)
      return true
    end
    false
  end

  private

  def valid_move?(piece,from,to)
    if piece.type != :pawn
      piece.valid_move?(from.capitalize,to.capitalize)
    else
      ((piece.valid_move?(from,to) && destiny_empty?(to)) || piece.capture_move?(from,to))
    end
  end

  def get_piece(from)
    board.get_piece(from)
  end

  def update_board(from,to,value)
    board.squares[to[0]][to[1]] = value
    board.squares[from[0]][from[1]] = ""
  end

  def destiny_empty?(to)
    ["",nil].include?(get_piece(to))
  end

end

# game = Game.new(Board.new(8,8),[Player.new("teste","white"),Player.new("teste1","black")])
# game.play
