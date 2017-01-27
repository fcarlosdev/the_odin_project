module Directions

  DIRECTIONS = {
    NORTH: [-1, 0], NE:   [-1, 1], EAST: [0,  1],  SE:  [1, 1], SOUTH: [1,  0],
    SW:    [1, -1], WEST: [0, -1], NW:   [-1, -1], NNW: [1,-2], NNE:   [-1,-2],
    ENE:   [-2,-1], ESE:  [-2, 1], SSE:  [-1,  2], SSW: [1, 2], WSW:   [ 2, 1],
    WNW:   [ 2,-1]
  }

  def self.all
    [:NORTH, :NE, :EAST, :SE, :SOUTH, :SW, :WEST, :NW, :NNW, :NNE, :ENE,
     :ESE, :SSE, :SSW, :WSW, :WNW]
  end

  def self.cardinal
    [:NORTH, :EAST, :SOUTH, :WEST]
  end

  def self.intercardinal
    [:NE, :SE, :SW, :NW]
  end

  def self.secondary
    [:NNW, :NNE, :ENE, :ESE, :SSE, :SSW, :WSW, :WNW]
  end

  def self.cardinal_and_ordinal
    cardinal + intercardinal
  end

  def self.xy_from_cardinals(cardinals)
    cardinals.collect {|c| DIRECTIONS[c]}
  end


end
