require "./lib/piece_new"

class Knight_New < Piece_New

  def initialize(color,position)
    super(:knight,color,position)
  end

  def possible_moves
    map_to_positions(get_coordinates(position,secondary))
  end

  private

  def get_coordinates(from,directions)
    calculate_moves(from,get_coordinates_from(directions))
  end

end
