require "./lib/move_piece"

class MoveBishop < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if diagonal_move?(piece,to) || capture_move?(piece,to)
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def diagonal_move?(piece,to)
    piece.possible_move?(to) && free_way?(piece,to) && !opponent_to?(piece,to)
  end

  def capture_move?(piece,to)
    piece.possible_move?(to) && opponent_to?(piece,to) && free_way?(piece,to)
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

end
