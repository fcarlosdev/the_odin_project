require "./lib/move_piece"

class MoveKing < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.valid_move?(to) && (empty_place?(to) || opponent_to?(piece,to))
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

end
