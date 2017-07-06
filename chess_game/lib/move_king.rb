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
      elsif piece.moves == 0 && valid_castling_move?(piece,to)
        board.move_piece(piece,to)
        return true
      end
    end
    false
  end
  private

  def valid_ordinary_move?(piece,to)
    empty_place?(to) && !opponent_to?(piece,to) && move_by(piece.position,to) == 1
  end

  def capture_move?(piece,to)
    opponent_to?(piece,to)
  end

  def valid_castling_move?(piece,to)
    has_castling_rook?(to,piece.position) && move_by(piece.position,to) == 2 &&
    free_way?(piece.position,to)
  end

  def has_castling_rook?(to,from)
    piece = value_at(rook_position(to,from))
    piece != nil && piece.type == :rook && piece.moves == 0
  end

  def rook_position(to,from)
    (from < to) ? "h".concat(to[1]) : "a".concat(to[1])
  end

  def free_way?(from,to)
    [path(from,to)-[from]].flatten.all?{|position| value_at(position) == nil}
  end

  def path(from,to)
    path = displacement(from,to).map{|i| [(from[0].ord + i).chr+from[1]]}.flatten
    (!path.empty?) ? path : []
  end

  def displacement(from,to)
    (from < to) ? (0..2) : (-2..0)
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

  def value_at(position)
    board.value_from(position)
  end

  def move_by(from,to)
    calc_distance(from,to).abs
  end

end
