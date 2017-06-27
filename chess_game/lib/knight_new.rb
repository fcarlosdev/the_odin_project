require "./lib/piece_new"
require "./lib/directions_new"

class Knight_New < Piece_New

  def initialize(color,position)
    super(:knight,color,position)
  end

  def possible_moves
    possible_positions(to_xy(position),Directions_New.secondary,1)
  end

  # private

end
