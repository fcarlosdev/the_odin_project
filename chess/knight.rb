require './piece.rb'

class Knight < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "N"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def default_coordinates
    get_coordinates_from(secondary)
  end

  def get_image
    (color == "white") ? "\u2658" : "\u265E"
  end


end
