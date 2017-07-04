require "./lib/piece"
require "./lib/directions_new"

class Pawn < Piece

  def initialize(color,position)
    super(:pawn,color,position)
  end

end
