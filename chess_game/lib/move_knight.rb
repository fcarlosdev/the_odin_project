require "./lib/move_piece"

class MoveKnight < MovePiece

  def initialize(board)
    @board = board
  end

  def move(piece,to)
    if simple_move?(piece,to) || capture_move?(piece,to)
      board.move_piece(piece,to) 
      return true
    end
    false
  end

  private

  def simple_move?(piece,to)
    valid_move?(piece,to) && board.empty_square?(to)
  end

  def capture_move?(piece,to)
    valid_move?(piece,to) && !board.empty_square?(to) && opponent_from?(piece,to)
  end

  def valid_move?(piece,to)
    piece.possible_moves.include?(to)
  end

end
