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

  def get_positions_with(final_position)
    positions = displacements(position).map{|d| generate_positions(position,d)}
    positions.select{|positions| positions.include?(final_position)}
  end

  private

  def valid_coordinates(from)
    calculate_moves(position,get_coordinates(from))
  end

  def get_coordinates(from)
    displacements(from).each_with_object([]) do |displacement,coordinates|
      displacement.map{|coordinate| coordinates << coordinate}
    end
  end

  def displacements(from)
    from_coordinates = map_to_axis(from)
    coordinates = []
    coordinates << get_north_coordinates(from_coordinates[0])
    coordinates << get_south_coordinates(from_coordinates[0])
    coordinates << get_east_coordinates(from_coordinates[1])
    coordinates << get_west_coordinates(from_coordinates[1])
  end

end
