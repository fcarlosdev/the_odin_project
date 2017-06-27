require "./lib/piece_new"
require "./lib/directions_new"

class Pawn_New < Piece_New

  def initialize(color,position)
    super(:pawn,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    possible_positions(to_xy(position),move_direction,1)
  end

  private

  def move_direction
    (color == :white) ? Directions_New.norwesteast : Directions_New.soutwesteast
  end

end
