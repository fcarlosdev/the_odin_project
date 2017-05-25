require_relative "move"
require_relative "move_pawn"
require_relative "move_bishop"
require_relative "move_king"
require_relative "move_queen"
require_relative "move_rook"
require_relative "move_knight"
require_relative "distance"

class Movements

  include Distance

  attr_reader :move_pawn, :move_king,   :move_rook,
              :move_queen,:move_bishop, :move_knight,
              :movements
  def initialize(board)
    @move_pawn   = MovePawn.new(board)
    @move_king   = MoveKing.new(board)
    @move_rook   = MoveRook.new(board)
    @move_queen  = MoveQueen.new(board)
    @move_bishop = MoveBishop.new(board)
    @move_knight = Moveknight.new(board)
    @movements   = set_movements
  end

  def move(piece,from,to)
    movements[piece.type].move(piece,from,to)
  end

  def valid_move?(piece,from,to)
    movements[piece.type].can_move?(piece,from,to)
  end

  def piece_between?(from,to)
    has_piece_between?(from,to)
  end

  private

  def set_movements
    {
      pawn:  @move_pawn,  king:   @move_king,   rook:   @move_rook,
      queen: @move_queen, bishop: @move_bishop, knight: @move_knight
    }
  end

  def has_piece_between?(from,to)
    (calc_distance(from,to).abs > 1) ? !all_positions_empty?(from,to) : false
  end

  def all_positions_empty?(from,to)
    positions_between(from,to).all? {|cell| cell == nil}
  end

  def positions_between(from,to)
    positions = (from < to) ? (from..to) : (to..from)
    positions.select {|ps| ![from,to].include?(ps)}
  end


end