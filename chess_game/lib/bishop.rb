require "./lib/piece"


class Bishop < Piece

  def initialize(color,position)
    super(:bishop,color,position)
  end

  def possible_moves
    map_to_positions(valid_coordinates(position)).sort
  end

  private

  def valid_coordinates(from)
    calculate_moves(position,get_coordinates(from))
  end

  def get_coordinates(from)
    from_coordinates = map_to_axis(from)
    get_northwest_coordinates(from_coordinates[0]) +
    get_southeast_coordinates(from_coordinates[0]) +
    get_southwest_coordinates(from_coordinates[1]) +
    get_northeast_coordinates(from_coordinates[0])
  end


end
