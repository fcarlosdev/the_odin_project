
class SideMove < MovementsNew

  def displacements(from)
    from_coordinates = map_to_axis(from)
    coordinates = []
    coordinates << get_east_coordinates(from_coordinates[1])
    coordinates << get_west_coordinates(from_coordinates[1])
  end

end
