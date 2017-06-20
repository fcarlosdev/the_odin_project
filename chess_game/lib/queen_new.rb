require "./lib/piece_new"
require "./lib/diagonal_move"
require "./lib/forward_move"
require "./lib/side_move"


class Queen_New < Piece_New

  def initialize(color,position)
    super(:queen,color,position)
    @movements = {forward: ForwardMove.new, diagonal: DiagonalMove.new, side: SideMove.new}
  end

  def possible_moves
    (forward_moves + diagonal_moves + side_moves).sort
  end

  def forward_moves
    movements[:forward].possible_positions(position)
  end

  def diagonal_moves
    movements[:diagonal].possible_positions(position)
  end

  def side_moves
    movements[:side].possible_positions(position)
  end

end
