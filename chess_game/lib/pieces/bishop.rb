require_relative 'piece'

class Bishop < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "B"+move}
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
    positions << generate_positions(from,get_northwest_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southeast_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southwest_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_northeast_coordinates(from_coordinates[0]))
    prefix_positions(positions.select {|values| values.include?(position[1..2])})
  end

  private

  def default_coordinates
    get_coordinates_from(intercardinal)
  end

  def generate_moves(from)
    @coordinates = generate_displaments(from)
    super(from)
  end

  def generate_displaments(from)
    from_coordinates = map_to_axis(from)
    get_northwest_coordinates(from_coordinates[0]) +
    get_southeast_coordinates(from_coordinates[0]) +
    get_southwest_coordinates(from_coordinates[1]) +
    get_northeast_coordinates(from_coordinates[0])
  end

  def get_image
    (color == "white") ? "\u2657" : "\u265D"
  end

  def prefix_positions(positions)
    positions.map {|values| perfix_positions_with("B",values) if !values.empty?}
  end

end
