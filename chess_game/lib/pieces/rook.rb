require_relative "piece"

class Rook < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "R"+move}
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
    prefix_positions(positions.select {|values| values.include?(position[1..2])})
  end


  private

  def default_coordinates
    get_coordinates_from(cardinal)
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
    get_west_coordinates(from_coordinates[1])
  end

  def get_image
    (color == "white") ? "\u2656" : "\u265C"
  end

  def prefix_positions(positions)
    positions.map {|values| perfix_positions_with("R",values) if !values.empty?}
  end

end
