require "./piece.rb"

class Pawn < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "P"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_coordinates
    get_coordinates_from(north_south)
  end

  def generate_moves(from)
    coordinates_for_two_squares(from)
    super(from)
  end

  def coordinates_for_two_squares(from)
    if (first_move?)
      update_first_move
      @coordinates = get_moves_by_two_squares(from)
    end
  end

  def get_moves_by_two_squares(from)
    coordinates.map {|v| [v[0],v[1]] + [v[0]+v[0],v[1]]}.flatten.each_slice(2).to_a
  end


end
