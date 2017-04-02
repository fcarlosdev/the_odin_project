require "./piece.rb"

class Rook < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "R"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_axis_directions
    get_axes_from(cardinal)
  end

  def generate_moves(from)
    @possible_directions = get_coordinates(from)
    super(from)
  end

  def get_coordinates(from)
    from_coordinates = map_to_axis(from)
    directions = get_north_coordinates(from_coordinates[0])
    directions |= get_south_coordinates(from_coordinates[0])
    directions |= get_east_coordinates(from_coordinates[1])
    directions |= get_west_coordinates(from_coordinates[1])
  end

end
