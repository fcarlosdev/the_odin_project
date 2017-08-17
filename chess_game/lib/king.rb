class King < Piece

  def initialize(color,position)
    super(:king,color,position)
  end

  def possible_moves
    generate_moves(default_directions).flatten.uniq.sort
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  private

  def generate_moves(directions)
    directions.each_with_object([]) do |direction,positions|
      move_by = possible_castling_move?(direction) ? 2 : 1
      positions << valid_positions(position,direction,move_by)
    end
  end

  def possible_castling_move?(direction)
    (side_directions.include?(direction) && moves == 0)
  end

  def default_directions
    Directions.cardinal_and_ordinal
  end

  def side_directions
    [Directions.choose(:east),Directions.choose(:west)]
  end

end
