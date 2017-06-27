require "./lib/piece_new"
require "./lib/directions_new"

class Queen_New < Piece_New

  def initialize(color,position)
    super(:queen,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    possible_positions(to_xy(position),Directions_New.cardinal_and_ordinal,7)
  end

  def forward_move?(to)
    forward_moves.include?(to)
  end

  def forward_moves
    possible_positions(to_xy(position),Directions_New.north_south,7)
  end

  def side_move?(to)
    side_moves.include?(to)
  end

  def side_moves
    possible_positions(to_xy(position),Directions_New.east_west,7)
  end

  def diagonal_move?(to)
    diagonal_moves.include?(to)
  end

  def diagonal_moves
    possible_positions(to_xy(position),Directions_New.intercardinal,7)
  end

  # private

end
