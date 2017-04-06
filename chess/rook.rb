require "./piece.rb"

class Rook < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "R"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_coordinates
    get_coordinates_from(cardinal)
  end

  def generate_moves(from)
    @possible_directions = get_coordinates(from)
    super(from)
  end

  def get_coordinates(from)
    from_coordinates = map_to_axis(from)
    get_north_coordinates(from_coordinates[0]) +
    get_south_coordinates(from_coordinates[0]) +
    get_east_coordinates(from_coordinates[1]) +
    get_west_coordinates(from_coordinates[1])
  end

end
