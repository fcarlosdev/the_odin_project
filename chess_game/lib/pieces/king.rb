require_relative "piece"

class King < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "K"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  def capture_moves(from)
    possible_moves(from)
  end

  def get_moves_with(position,from)
    capture_moves(from).select {|move| move[1..2] == position[1..2]}
  end

  private

  def default_coordinates
    get_coordinates_from(cardinal_and_ordinal)
  end

  def get_image
    (color == "white") ? "\u2654" : "\u265A"
  end


end
