require_relative 'coordenates'

module Diagonals

  include Coordenates

  def diagonals_between(from,to)
    diagonals(from).select {|ps| ps.include?(to[1..2])}.flatten.select {|v| v < to[1..2]}
  end

  def diagonals(from)
    from_coordinates = map_to_axis(from)
    positions = []
    positions << generate_positions(from,get_northwest_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southeast_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southwest_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_northeast_coordinates(from_coordinates[0]))
  end

end
