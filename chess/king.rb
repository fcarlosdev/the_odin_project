require "./piece.rb"

class King < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "K"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_coordinates
    get_coordinates_from(cardinal_and_ordinal)
  end

  def get_image
    (color == "white") ? "\u2654" : "\u265A"
  end


end
