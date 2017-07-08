require "./lib/move_piece"

class MoveKing < MovePiece

  attr_reader :board

  # Delete this constructor, implementing equal to piece.
  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      if valid_ordinary_move?(piece,to) || capture_move?(piece,to) || valid_castling_move?(piece,to)
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
    allowed_castling_move?(piece,to) && free_way?(piece.position,to) && rook_moved_next?(to)
  end

  def allowed_castling_move?(piece,to)
    piece.first_move? && piece.position[1] == to[1]
  end

  def free_way?(from,to)
    [path(from,to)-[from]].flatten.all?{|position| empty_place?(position)}
  end

  def path(from,to)
    path = displacement(from,to).map{|i| [(from[0].ord + i).chr+from[1]]}
    (!path.empty?) ? path.flatten : []
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

  def move_by(from,to)
    calc_distance(from,to)
  end

  def rook_moved_next?(to)
    moves = rook_moves_next(to)
    rook_from = moves[:from]
    rook_to = moves[:to]

    if !empty_place?(rook_from)
      piece = board.value_from(rook_from)
      if piece.type == :rook && piece.first_move?
        board.move_piece(piece,rook_to)
        return true
      end
    end

    false

  end

  def rook_moves_next(king_to)
    if (king_to[0] == "g")
      return {from: "h".concat(king_to[1]), to: "f".concat(king_to[1])}
    elsif (king_to[0] == "c")
      return {from: "a".concat(king_to[1]), to: "d".concat(king_to[1])}
    end
    []
  end

end
