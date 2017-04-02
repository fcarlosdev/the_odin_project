module Mapper

  def map_to_axis(from_position)
    [to_row(from_position[2].to_i),to_column(from_position[1].ord)]
  end

  def map_to_positions(from_axes)
    from_axes.map {|axis| ('a'.ord + axis[1]).chr + (8 - axis[0]).to_s}
  end

  def to_row(rank)
    (rank == 0) ? 0 : (8 - rank)
  end

  def to_column(file)
    (file - 'a'.ord)
  end

end
