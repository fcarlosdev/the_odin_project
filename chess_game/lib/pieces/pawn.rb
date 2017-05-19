require_relative "piece"

class Pawn < Piece

  attr_reader :en_passant_allowed, :move_direction

  def post_initialize
    set_en_passant
    set_direction
  end

  def possible_moves(from)
    generate_moves(from).map {|move| "P"+move} + capture_moves(from)
  end

  def valid_move?(from,to)
    can_move?(from,to) && possible_moves(from).include?(to)
  end

  def capture_move?(from,to)
    file_distance(from,to) == 1 && rank_distance(from,to) == 1
  end

  def moved_by=(number_of_squares)
    @moved_by = number_of_squares
  end

  def en_passant_allowed=(allowed)
    @en_passant_allowed = allowed
  end

  def capture_moves
    possible_moves(@curren_position)
  end

  def capture_moves(from)
    map_to_positions(calculate_moves(from,diagonals_coordinates)).map {|l| "P"+l}
  end

  def get_moves_with(position,from)
    capture_moves(from).select {|move| move[1..2] == position[1..2]}
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
    @coordinates = get_moves_by_two_squares(from)
  end

  def get_moves_by_two_squares(from)
    coordinates.map {|v| [v[0],v[1]] + [v[0]+v[0],v[1]]}.flatten.each_slice(2).to_a
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

  def set_direction
    @move_direction = color.eql?("white") ? :NORTH : :SOUTH
  end

  def set_en_passant
    @en_passant_allowed = false
  end

  def can_move?(from,to)
    (rank_distance(from,to) == 1 || (rank_distance(from,to) == 2 && @number_of_moves == 0 ))
  end


end
