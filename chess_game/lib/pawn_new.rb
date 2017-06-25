require "./lib/piece_new"
require "./lib/directions_new"

class Pawn_New < Piece_New

  attr_reader :en_passant

  def initialize(color,position)
    super(:pawn,color,position)
    @en_passant = false
  end

  def possible_moves
    to_positions(generate_directions(to_xy(position),1))
  end

  def en_passant=(new_status)
    @en_passant = new_status
  end

  private

  def to_positions(coordinates)
    coordinates.map{|r| map_to_positions(r)}.flatten.uniq.sort
  end

  def generate_directions(from,move_by)
    Directions_New.cardinal.map{|d| new_coordinate(from,move_by,d)}
  end

  def new_coordinate(from,move_by,direction)
    Directions_New.generate_coordinates(from,move_by,direction)
  end

  def to_xy(position)
    map_to_axis(position)
  end


end
