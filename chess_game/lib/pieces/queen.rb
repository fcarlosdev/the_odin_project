require_relative "piece"

class Queen < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "Q"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  def capture_moves(from)
    possible_moves(from)
  end

  private

  def default_coordinates
    get_coordinates_from(cardinal + intercardinal + secondary)
  end

  def generate_moves(from)
    @coordinates = generate_displaments(from)
    super(from)
  end

  def generate_displaments(from)
    from_coordinates = map_to_axis(from)
    get_north_coordinates(from_coordinates[0]) +
    get_south_coordinates(from_coordinates[0]) +
    get_east_coordinates(from_coordinates[1]) +
    get_west_coordinates(from_coordinates[1])+
    get_northwest_coordinates(from_coordinates[0])  +
    get_southeast_coordinates(from_coordinates[0])  +
    get_southwest_coordinates(from_coordinates[1]) +
    get_northeast_coordinates(from_coordinates[0])
  end

  def get_image
    (color == "white") ? "\u2655" : "\u265B"
  end


end
