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

  def get_coordinates_from(directions)
    directions.collect {|c| DIRECTIONS[c]}
  end

  def get_north_coordinates(from_rank)
    from_rank.downto(1).map {|rank| [rank * DIRECTIONS[:NORTH][0],DIRECTIONS[:NORTH][1]]}
  end

  def get_south_coordinates(from_rank)
    (1..(7-from_rank)).map {|rank| [rank * DIRECTIONS[:SOUTH][0],DIRECTIONS[:SOUTH][1]]}
  end

  def get_east_coordinates(from_file)
    (0..(7-from_file)).map {|file| [DIRECTIONS[:EAST][0], file * DIRECTIONS[:EAST][1]]}
  end

  def get_west_coordinates(from_file)
    from_file.downto(1).map {|file| [DIRECTIONS[:WEST][0], file * DIRECTIONS[:WEST][1]]}
  end

  def get_northwest_coordinates(from_file)
    (0..from_file-1).map {|i| [DIRECTIONS[:NW][0]-i, DIRECTIONS[:NW][1]-i]}
  end

  def get_southeast_coordinates(from_rank)
    (0..(6-from_rank)).map {|i| [DIRECTIONS[:SE][0]+i, DIRECTIONS[:SE][1]+i]}
  end

  def get_southwest_coordinates(from_file)
    (from_file -1).downto(0).map {|i| [DIRECTIONS[:SW][0]+i, DIRECTIONS[:SW][1]-i]}
  end

  def get_northeast_coordinates(from_rank)
    (0..from_rank-1).map {|i| [DIRECTIONS[:NE][0]-i, DIRECTIONS[:NE][1]+i]}    
  end

end
