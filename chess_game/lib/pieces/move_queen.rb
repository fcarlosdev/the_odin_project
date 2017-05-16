require_relative "move"

class MoveQueen < Move

  def move(piece,from,to)
    if can_move?(piece,from,to)
      update_position_of(piece,from,to)
      return true
    end
    return false
  end

  def can_move?(piece,from,to)
    !has_piece_between?(piece,from,to) &&
    (ordinary_move?(piece,from,to) || capture_move?(piece,from,to))
  end

  private

  def has_piece_between?(piece,from,to)
    diagonals = diagonals_between(from,to)
    (!diagonals.empty?) ? any_position_filled?(diagonals) : super(piece,from,to)
  end

  def ordinary_move?(piece,from,to)
    valid_move?(piece,from,to) && empty_square?(to)
  end

  def capture_move?(piece,from,to)
    valid_move?(piece,from,to) && !empty_square?(to) && opponent_of?(piece,to)
  end

  def valid_move?(piece,from,to)
    piece.valid_move?(from,to)
  end


  def diagonals_between(from,to)
    positions = diagonal_positions(from).select {|ps| ps.include?(to[1..2])}
    perfix_positions_with("Q",positions.flatten.select {|v| v < to[1..2]})
  end

  def diagonal_positions(from)
    from_coordinates = map_to_axis(from)
    positions = []
    positions << generate_positions(from,get_northwest_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southeast_coordinates(from_coordinates[0]))
    positions << generate_positions(from,get_southwest_coordinates(from_coordinates[1]))
    positions << generate_positions(from,get_northeast_coordinates(from_coordinates[0]))
  end

end
