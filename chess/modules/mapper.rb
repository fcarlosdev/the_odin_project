module Mapper

  def map_to_axis(from_position)
    [from_position[2].to_i,from_position[1].ord]
  end

  def map_to_positions(from_axes)
    from_axes.map {|axis| axis[1].chr + axis[0].to_s}
  end

end
