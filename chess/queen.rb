require './piece.rb'

class Queen < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "Q"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def default_coordinates
    get_coordinates_from(cardinal_and_ordinal)
  end

  def generate_moves(from)
    @coordinates = generate_coordinates(from)
    super(from)
  end

  def generate_coordinates(from)
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
