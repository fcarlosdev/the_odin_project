require "./lib/piece_new"
require "./lib/directions_new"

class Knight_New < Piece_New

  def initialize(color,position)
    super(:knight,color,position)
  end

  def possible_moves
    to_positions(generate_directions(to_xy(position),1))
  end

  private

  def get_coordinates(from,directions)
    calculate_moves(from,get_coordinates_from(directions))
  end

  def to_positions(coordinates)
    coordinates.map{|r| map_to_positions(r)}.flatten.uniq.sort
  end

  def generate_directions(from,move_by)
    Directions_New.secondary.map{|d| new_coordinate(from,move_by,d)}
  end

  def new_coordinate(from,move_by,direction)
    Directions_New.generate_coordinates(from,move_by,direction)
  end

  def to_xy(position)
    map_to_axis(position)
  end


end
