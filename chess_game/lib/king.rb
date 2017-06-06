require "./lib/piece"

class King < Piece

  def initialize(color,position)
    super(:king,color,position)
  end

  def possible_moves
    generate_positions(cardinal_and_ordinal)
  end

  def capture_moves
    possible_moves
  end

  def get_positions_with(final_position)
    possible_moves
  end


  private

  def generate_positions(directions)
    if (moves == 0)
      map_to_positions(new_axes_moves(directions)) + castling_positions
    else
      map_to_positions(new_axes_moves(directions))
    end
  end

  def new_axes_moves(directions)
    calculate_moves(position,get_coordinates_from(directions))
  end

  def castling_positions
    [-2,2].map{|displacement| (position[0].ord + displacement).chr+position[1] }
  end


end
