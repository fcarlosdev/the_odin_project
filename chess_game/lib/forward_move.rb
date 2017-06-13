require "./lib/movements_new"

class ForwardMove < MovementsNew

  def displacements(from)
    from_coordinates = map_to_axis(from)
    coordinates = []
    coordinates << get_north_coordinates(from_coordinates[0])
    coordinates << get_south_coordinates(from_coordinates[0])
  end

end
