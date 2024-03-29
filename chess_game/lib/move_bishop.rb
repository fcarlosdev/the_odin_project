class MoveBishop < MovePiece

  def initialize(board)
    @board = board
  end

  def move(piece,to)
    if piece.possible_move?(to) && free_way?(piece.position,to)
      if empty_place?(to) || opponent_from?(piece,to)
        board.move_piece(piece,to)
        return true
      end
    end
    false
  end

end
