require_relative 'coordenates'

module Diagonals

  include Coordenates

  def diagonals_between(from,to)
    positions = diagonals(from).select {|ps| ps.include?(to[1..2])}.flatten
    select_from(positions,from[1..2],to[1..2])
  end

  def diagonals(from)
    from_coordinates = map_to_axis(from)
    positions = []
    positions << generate_positions(from,get_northwest_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southeast_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southwest_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_northeast_coordinates(from_coordinates[0]))
  end

  def select_from(positions,from,to)
    positions.select {|v| range(from,to).include?(v) && v != to}
  end

  def range(from,to)
    (from < to) ? (from..to) : (to..from)
  end

end
