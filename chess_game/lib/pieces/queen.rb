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

  def get_moves_with(position,from)
    from_coordinates = map_to_axis(from)
    positions = []
    positions << generate_positions(from,get_north_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_south_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_east_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_west_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_northwest_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southeast_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southwest_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_northeast_coordinates(from_coordinates[0]))
    prefix_positions(positions.select {|values| values.include?(position[1..2])})
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

  def prefix_positions(positions)
    positions.map {|values| perfix_positions_with("Q",values) if !values.empty?}
  end

end
