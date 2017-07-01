require "./lib/piece"
require "./lib/directions_new"

class Pawn < Piece

  def initialize(color,position)
    super(:pawn,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    default_moves = possible_positions(to_xy(position),move_direction,1)
    add_position(default_moves)
  end

  def forward_move?(to)
    (position[0] == to[0] && position[1] != to[1])
  end

  def capture_move?(to)
    (position[0] != to[0] && position[1] != to[1])
  end

  private

  def move_direction
    (color == :white) ? Directions_New.norwesteast : Directions_New.soutwesteast
  end

  def add_position(places)
    if !first_move? && moves == 0
      places << (position[0] + (position[1].to_i + displacement_by).to_s)
    end
    places
  end

  def displacement_by
    (color == :white) ? 2 : -2
  end

end
