class Knight < Piece

  def initialize(color,position)
    super(:knight,color,position)
  end

  def possible_moves
    generate_moves(position,Directions.secondary,1).flatten.sort
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  private

  def generate_moves(from,directions,number_of_moves)
    directions.map{|d| valid_positions(from,d,number_of_moves)}
  end

end
