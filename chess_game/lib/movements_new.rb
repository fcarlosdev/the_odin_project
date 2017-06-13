require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/directions"

class MovementsNew

  include Mapper
  include Coordenates
  include Directions

  def possible_positions(from)
    map_to_positions(calculate_moves(from,get_coordinates(from)))
  end

  def get_coordinates(from)
    displacements(from).each_with_object([]) do |displacement,coordinates|
      displacement.map{|coordinate| coordinates << coordinate}
    end
  end

end
