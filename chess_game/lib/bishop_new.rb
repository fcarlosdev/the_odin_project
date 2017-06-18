require "./lib/piece_new"
require "./lib/diagonal_move"

class Bishop_New < Piece_New

  def initialize(color,position)
    super(:bishop,color,position)
    @movements = {diagonal: DiagonalMove.new}
  end

  def possible_moves
    movements[:diagonal].possible_positions(position).sort
  end

  def diagonal_moves
    movements[:diagonal].possible_positions(position)
  end

end
