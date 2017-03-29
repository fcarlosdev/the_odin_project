require './modules/mapper.rb'

module CalculateMoves

  include Mapper

  def calculate_moves(from,axes)
    xy = map_to_axis(from)
    remove_invalid_positions(axes.map{|axis| [xy[0]+axis[0], xy[1]+axis[1]]})
  end

  def remove_invalid_positions(axes)
    axes.select {|axis| (0..8).include?(axis[0]) && (97..104).include?(axis[1])}
  end


end
