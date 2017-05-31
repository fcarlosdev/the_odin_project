require "./lib/piece"

class Knight < Piece

  def initialize(color,position)
    super(:knight,color,position)
  end

  def possible_moves
    generate_positions(secondary)
  end

  private

  def generate_positions(directions)
    map_to_positions(new_axes_moves(directions))
  end

  def new_axes_moves(directions)
    calculate_moves(position,get_coordinates_from(directions))
  end

end
