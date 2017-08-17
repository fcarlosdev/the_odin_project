require "./lib/piece"

class Queen < Piece

  def initialize(color,position)
    super(:queen,color,position)
  end

  def possible_moves
    moves = generate_moves(position,Directions.cardinal_and_ordinal,7)
    remove_invalid_moves(moves.flatten.sort)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  private

  def generate_moves(from,directions,number_of_moves)
    directions.map{|d| valid_positions(from,d,number_of_moves)}
  end

  def remove_invalid_moves(moves)
    moves.select{|m| !m.empty?}
  end

end
