require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/directions"
require_relative "modules/distance"
require "directions_new"

class MovementsNew

  include Mapper
  include Coordenates
  include Directions
  include Distance

  def possible_positions(from,coordinates=[])
    if coordinates.empty?
      map_to_positions(calculate_moves(from,get_coordinates(from)))
    else
      map_to_positions(calculate_moves(from,coordinates))
    end
  end

  def get_coordinates(from)
    displacements(from).each_with_object([]) do |displacement,coordinates|
      displacement.map{|coordinate| coordinates << coordinate}
    end
  end

  def displacements(from)
    coordinates = []
  end

end
