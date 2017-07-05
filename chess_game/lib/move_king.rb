require "./lib/move_piece"

class MoveKing < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      if valid_ordinary_move?(piece,to) || capture_move?(piece,to)
        board.move_piece(piece,to)
        return true
      elsif piece.moves == 0
        rook = board.value_from("g".concat(to[1]))
        if (to > piece.position && !rook.nil? && rook.moves == 0 &&
            rook.color == piece.color && rook.type == :rook)
            board.move_piece(piece,to)
            return true
        end
      end
    end
    false
  end
  private

  def valid_ordinary_move?(piece,to)
    empty_place?(to) && !opponent_to?(piece,to)
  end

  def capture_move?(piece,to)
    opponent_to?(piece,to)
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

end
