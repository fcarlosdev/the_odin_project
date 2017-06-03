require_relative 'mapper'

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
    squares = on_range?(map_to_axis(from)) ? [-1,1].map {|v| move_by(v,from) } : []
    select_right_position(squares)
  end

  def square_at_right_side(from)
    on_range?(map_to_axis(from)) ? move_by(1,from) : []
  end

  def square_at_left_side(from)
    on_range?(map_to_axis(from)) ? move_by(-1,from) : []
  end

  def on_range?(axis)
    (0..7).include?(axis[0]) && (0..7).include?(axis[1])
  end

  def move_by(number,from)
    xy = map_to_axis(from)
    map_to_position([xy[0],(xy[1]+number)])
  end

  def generate_positions(from,coordinates)
    map_to_positions(calculate_moves(from,coordinates))
  end

  def select_right_position(squares)
    squares.select{|s| ("a".."h").cover?(s[0]) && (0..7).cover?(s[1].to_i) }
  end


end
