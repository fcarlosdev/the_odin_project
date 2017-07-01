require "./lib/piece"

class Bishop < Piece

  def initialize(color,position)
    super(:bishop,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    possible_positions(to_xy(position),Directions_New.intercardinal,7)
  end

end
