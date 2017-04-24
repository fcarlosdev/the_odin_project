require './modules/mapper.rb'

module Coordenates

  include Mapper

  def calculate_moves(from,axes)
    xy = map_to_axis(from)
    remove_invalid_positions(axes.map{|axis| [xy[0]+axis[0], xy[1]+axis[1]]})
  end

  def remove_invalid_positions(axes)
    axes.select {|axis| on_range?(axis)}
  end

  def squares_at_side_of(from)
    xy = map_to_axis(from)
    on_range?(xy) ? [-1,1].map {|v| map_to_position([xy[0],(xy[1]+v)]) } : []
  end

  def square_at_right_side(from)
    xy = map_to_axis(from)
    on_range?(xy) ? map_to_position([xy[0],(xy[1]+1)]) : []
  end

  def square_at_left_side(from)
    xy = map_to_axis(from)
    on_range?(xy) ? map_to_position([xy[0],(xy[1]-1)]) : []
  end

  def on_range?(axis)
    (0..7).include?(axis[0]) && (0..7).include?(axis[1])
  end


end
