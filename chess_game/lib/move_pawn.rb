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
      elsif (piece.position[0] != to[0] && piece.position[1] != to[1]) && !board.empty_square?(to) &&
            board.value_from(to).color != piece.color
        board.move_piece(piece,to)
        return true
      elsif (piece.position[0] != to[0] && piece.position[1] != to[1]) && board.empty_square?(to) &&
        board.value_from(to[0]+piece.position[1]) != nil &&
        board.value_from(to[0]+piece.position[1]).color != piece.color &&
        board.value_from(to[0]+piece.position[1]).first_move?

        board.move_piece(piece,to)
        return true
      end
    end

    false
  end

  private


end
