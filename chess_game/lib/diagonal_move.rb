require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/directions"
require_relative "modules/distance"

class DiagonalMove

  include Mapper
  include Coordenates
  include Directions
  include Distance

  def diagonal_positions(from,directions,move_by)
    if move_by == 1
      generate_next_position(from,directions)
    elsif move_by > 1
      generate_next_positions(from,directions)
    end
  end

  private

  def generate_next_position(from,directions)
    map_to_positions(displacement_one(from,directions))
  end

  def generate_next_positions(from,directions)
    map_to_positions(calculate_moves(from,get_coordinates(from)))
  end

  def get_coordinates(from)
    displacements(from).each_with_object([]) do |displacement,coordinates|
      displacement.map{|coordinate| coordinates << coordinate}
    end
  end

  def displacement_one(from,directions)
    calculate_moves(from,get_coordinates_from(directions))
  end

  def displacements(from)
    from_coordinates = map_to_axis(from)
    coordinates = []
    coordinates << get_northwest_coordinates(from_coordinates[0])
    coordinates << get_southeast_coordinates(from_coordinates[0])
    coordinates << get_southwest_coordinates(from_coordinates[1])
    coordinates << get_northeast_coordinates(from_coordinates[0])
  end

end
