require_relative "piece"

class Knight < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "N"+move}
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
    get_coordinates_from(secondary)
  end

  def get_image
    (color == "white") ? "\u2658" : "\u265E"
  end


end
