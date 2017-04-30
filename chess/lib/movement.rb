require_relative "move"
require_relative "move_pawn"
require_relative "move_bishop"
require_relative "move_king"
require_relative "move_queen"
require_relative "move_rook"
require_relative "move_knight"

class Movement

  attr_reader :move_pawn, :move_king,   :move_rook,
              :move_queen,:move_bishop, :move_knight
  def initialize(board)
    @move_pawn   = MovePawn.new(board)
    @move_king   = MoveKing.new(board)
    @move_rook   = MoveRook.new(board)
    @move_queen  = MoveQueen.new(board)
    @move_bishop = MoveBishop.new(board)
    @move_knight = Moveknight.new(board)
  end

end
