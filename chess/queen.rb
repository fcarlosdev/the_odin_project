require './piece.rb'

class Queen < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "Q"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_coordinates
    get_coordinates_from(cardinal_and_ordinal)
  end

end
