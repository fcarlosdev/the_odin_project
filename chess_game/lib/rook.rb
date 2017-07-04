require "./lib/piece"

class Rook < Piece

  def initialize(color,position)
    super(:rook,color,position)
  end

  def possible_moves
     remove_invalid_moves(generate_moves(position,Directions_New.cardinal,7))
  end

  private

  def generate_moves(from,directions,number_of_moves)
    directions.map{|d| valid_positions(from,d,number_of_moves)}
  end

  def remove_invalid_moves(moves)
    moves.select{|m| !m.empty?}
  end

end
