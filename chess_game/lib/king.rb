require "./lib/piece"
require "./lib/directions_new"

class King < Piece

  def initialize(color,position)
    super(:king,color,position)
  end

  def possible_moves
    generate_moves(position,directions,1).flatten.sort
  end

  def valid_move?(to)
    possible_moves.include?(to)
  end

  def possible_castling_move?(to)
    moves = generate_moves(position,Directions_New.east_west,2)
    moves.any?{|move| move.include?(to)}
  end

  private

  def generate_moves(from,direction,limit)
    directions.map{|direction| valid_positions(from,direction,limit)}.flatten.sort
  end

  def directions
    Directions_New.cardinal_and_ordinal
  end

end
