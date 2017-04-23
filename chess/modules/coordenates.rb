require './modules/mapper.rb'

module Coordenates

  include Mapper

  def calculate_moves(from,axes)
    xy = map_to_axis(from)
    remove_invalid_positions(axes.map{|axis| [xy[0]+axis[0], xy[1]+axis[1]]})
  end

  def remove_invalid_positions(axes)
    axes.select {|axis| (0..7).include?(axis[0]) && (0..7).include?(axis[1])}
  end

  def squares_at_side_of(from)
    xy = map_to_axis(from)
    (0..7).include?(xy[1]) ? [-1,1].map {|v| map_to_position([xy[0],(xy[1]+v)]) } : []
  end

end
