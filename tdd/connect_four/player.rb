class Player

  attr_reader :name, :piece

  def initialize(name,piece)
    @name = name
    @piece = piece
  end

  def drop_a_piece(board,position)
    board.drop_a_piece(position,piece)
  end
end
