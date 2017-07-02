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

  def move_direction(to)
    return Directions_New.northeast if (position[0] < to[0] && position[1] < to[1])
    return Directions_New.southwest if (position[0] > to[0] && position[1] > to[1])
    return Directions_New.northwest if (position[0] > to[0] && position[1] < to[1])
    return Directions_New.southeast if (position[0] < to[0] && position[1] > to[1])
  end

end
