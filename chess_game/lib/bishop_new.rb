require "./lib/piece_new"
require "./lib/diagonal_move"

class Bishop_New < Piece_New

  def initialize(color,position)
    super(:bishop,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    possible_positions(to_xy(position),Directions_New.intercardinal,7)
  end

  # private

end
