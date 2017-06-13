require "./lib/movements_new"

class DiagonalMove < MovementsNew

  def displacements(from)
    from_coordinates = map_to_axis(from)
    coordinates = []
    coordinates << get_northwest_coordinates(from_coordinates[0])
    coordinates << get_southeast_coordinates(from_coordinates[0])
    coordinates << get_southwest_coordinates(from_coordinates[1])
    coordinates << get_northeast_coordinates(from_coordinates[0])
  end

end
