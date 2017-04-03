require "./piece.rb"

class Pawn < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "P"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_axis_directions
    get_coordinates_from(north_south)
  end


end
