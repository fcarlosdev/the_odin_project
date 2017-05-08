module Mapper

  def map_to_axis(from_position)
    [to_row(from_position[2].to_i),to_column(from_position[1].ord)]
  end

  def map_to_positions(from_axes)
    from_axes.map {|axis| map_to_position(axis)}
  end

  def to_row(rank)
    (rank == 0) ? 0 : (8 - rank)
  end

  def map_to_position(from_axis)
    (from_axis.length > 0) ? to_file(from_axis[1]) + to_rank(from_axis[0]) : ""
  end

  def to_column(file)
    (file - 'a'.ord)
  end

  def to_rank(row)
    (8 - row).to_s
  end

  def to_file(col)
    ('a'.ord + col).chr
  end

  def perfix_positions_with(prefix,positions)
    positions.map {|position| prefix_position_with(prefix,position)}
  end

  def prefix_position_with(prefix,position)
    prefix+position
  end

end
