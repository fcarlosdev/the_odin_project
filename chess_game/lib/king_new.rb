require "./lib/piece_new"
require "./lib/forward_move"
require "./lib/diagonal_move"
require "./lib/side_move"
require "./lib/directions_new"

class King_New < Piece_New

  def initialize(color,position)
    super(:king_new,color,position)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def possible_moves
    possible_positions(to_xy(position),Directions_New.cardinal_and_ordinal,1)
  end

  def forward_move?(to)
    forward_moves.include?(to)
  end

  def forward_moves
    possible_positions(to_xy(position),Directions_New.north_south,1)
  end

  def side_move?(to)
    side_moves.include?(to)
  end

  def side_moves
    moves = possible_positions(to_xy(position),Directions_New.east_west,1)
    add_castling_moves(moves) if first_move?
    moves
  end

  def diagonal_move?(to)
    diagonal_moves.include?(to)
  end

  def diagonal_moves
    possible_positions(to_xy(position),Directions_New.intercardinal,1)
  end

  private

  def add_castling_moves(moves)
    generate_castling_moves(moves).each {|cm| moves << cm if !moves.include?(cm) }
  end

  def generate_castling_moves(moves)
    moves.map{|m| [-2,2].map{ |value| (m[0].ord + value).chr.concat(m[1]) } }.flatten
  end

  # def to_xy(position)
  #   map_to_axis(position)
  # end

end
