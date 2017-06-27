class MovePawn

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      if (piece.position[0] == to[0]) && board.empty_square?(to)
        board.move_piece(piece,to)
        return true
      end
    end

    false
  end

  private


end
