require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/distance"
require_relative "directions_new"


class DiagonalMove

  include Mapper
  include Coordenates
  include Distance

  def all_possible_moves(position,limit)
    possible_southwest_moves(position,limit) +
    possible_northeast_moves(position,limit) +
    possible_northwest_moves(position,limit) +
    possible_southeast_moves(position,limit)
  end

  def possible_northeast_moves(position,limit)
    valid_moves(position,limit,Directions_New.northeast)
  end

  def possible_northwest_moves(position,limit)
    valid_moves(position,limit,Directions_New.northwest)
  end

  def possible_southeast_moves(position,limit)
    valid_moves(position,limit,Directions_New.southeast)
  end

  def possible_southwest_moves(position,limit)
    valid_moves(position,limit,Directions_New.southwest)
  end

  private

  def valid_moves(position,limit,direction)
    map_to_positions(coordinates(map_to_axis(position),limit,direction))
  end

  def coordinates(from,limit,direction)
    Directions_New.generate_coordinates(from,limit,direction)
  end

end
