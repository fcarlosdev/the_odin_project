require "./piece.rb"

class Pawn < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "P"+move} + capture_moves(from)
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  def capture_move?(from,to)
    file_distance(from,to) == 1 && rank_distance(from,to) == 1
  end

  private

  def default_coordinates
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

  def capture_moves(from)
    map_to_positions(calculate_moves(from,diagonals_coordinates)).map {|l| "P"+l}
  end

  def diagonals_coordinates
    (color == "white") ? get_coordinates_from([:NE, :NW]) : get_coordinates_from([:SW, :SE])
  end

  def get_image
    (color == "white") ? "\u2659" : "\u265F"
  end

  def empty?(value)
    ["",nil].include?(value)
  end

end
