require "./lib/piece"

class Rook < Piece

  def initialize(color,position)
    super(:rook,color,position)
  end

  def possible_moves
    map_to_positions(valid_coordinates(position)).sort
  end

  def capture_moves
    possible_moves
  end

  private

  def valid_coordinates(from)
    calculate_moves(position,get_coordinates(from))
  end

  def get_coordinates(from)
    from_coordinates = map_to_axis(from)
    get_north_coordinates(from_coordinates[0])+
    get_south_coordinates(from_coordinates[0])+
    get_east_coordinates(from_coordinates[1])+
    get_west_coordinates(from_coordinates[1])
  end

end
