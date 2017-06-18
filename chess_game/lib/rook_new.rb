require "./lib/piece_new"
require "./lib/forward_move"
require "./lib/side_move"

class Rook_New < Piece_New

  def initialize(color,position)
    super(:rook,color,position)
    @movements = {forward: ForwardMove.new, side: SideMove.new}
  end

  def possible_moves
    (movements[:forward].possible_positions(position) +
     movements[:side].possible_positions(position)).sort
  end

  def forward_moves
    movements[:forward].possible_positions(position)
  end

  def side_moves
   movements[:side].possible_positions(position)
  end

end
