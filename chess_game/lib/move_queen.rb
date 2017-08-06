require "./lib/move_piece"

class MoveQueen < MovePiece

  def initialize(board)
    @board = board
  end

  def move(piece,to,simulation=false)
      if piece.possible_move?(to) && free_way?(piece.position,to)
        if (ordinary_move?(piece,to) && empty_place?(to)) || capture_move?(piece,to)
          board.move_piece(piece,to) if !simulation
          return true
        end
      end
    false
  end

  private

  def ordinary_move?(piece,to)
    forward_move?(piece.position,to) || side_move?(piece.position,to) ||
    diagonal_move?(piece.position,to)
  end

  def capture_move?(piece,to)
    ordinary_move?(piece,to) && opponent_from?(piece,to)
  end

end
