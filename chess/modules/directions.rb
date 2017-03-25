module Directions

  DIRECTIONS = {
    NORTH: [-1, 0], NE:   [-1, 1], EAST: [0,  1],  SE:  [1, 1], SOUTH: [1,  0],
    SW:    [1, -1], WEST: [0, -1], NW:   [-1, -1], NNW: [1,-2], NNE:   [-1,-2],
    ENE:   [-2,-1], ESE:  [-2, 1], SSE:  [-1,  2], SSW: [1, 2], WSW:   [ 2, 1],
    WNW:   [ 2,-1]
  }

  def all
    [:NORTH, :NE, :EAST, :SE, :SOUTH, :SW, :WEST, :NW, :NNW, :NNE, :ENE,
     :ESE, :SSE, :SSW, :WSW, :WNW]
  end

  def cardinal
    [:NORTH, :EAST, :SOUTH, :WEST]
  end

  def intercardinal
    [:NE, :SE, :SW, :NW]
  end

  def secondary
    [:NNW, :NNE, :ENE, :ESE, :SSE, :SSW, :WSW, :WNW]
  end

  def cardinal_and_ordinal
    cardinal + intercardinal
  end

  def north_south
    [:NORTH, :SOUTH]
  end

  def get_axes_from(directions)
    directions.collect {|c| DIRECTIONS[c]}
  end

end
