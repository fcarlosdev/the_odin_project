require "./lib/piece_new"
require "./lib/diagonal_move"
require "./lib/forward_move"
require "./lib/side_move"
require "./lib/directions_new"

class Queen_New < Piece_New

  def initialize(color,position)
    super(:queen,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    to_positions(generate_directions(to_xy(position),Directions_New.cardinal_and_ordinal,7))
  end

  def forward_move?(to)
    forward_moves.include?(to)
  end

  def forward_moves
    to_positions(generate_directions(to_xy(position),Directions_New.north_south,7))
  end

  def side_move?(to)
    side_moves.include?(to)
  end

  def side_moves
    to_positions(generate_directions(to_xy(position),Directions_New.east_west,7))
  end

  def diagonal_move?(to)
    diagonal_moves.include?(to)
  end
  
  def diagonal_moves
    to_positions(generate_directions(to_xy(position),Directions_New.intercardinal,7))
  end

  private

  def to_positions(coordinates)
    coordinates.map{|r| map_to_positions(r)}.flatten.uniq.sort
  end

  def generate_directions(from,directions,move_by)
    directions.map{|d| new_coordinate(from,move_by,d)}
  end

  def new_coordinate(from,move_by,direction)
    Directions_New.generate_coordinates(from,move_by,direction)
  end

  def to_xy(position)
    map_to_axis(position)
  end


end
