class MoveKing < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      if (ordinary_move?(piece,to) && empty_place?(to)) || capture_move?(piece,to)
        board.move_piece(piece,to)
        return true
      elsif castling_move?(piece,to)
        board.move_piece(piece,to)
        return true
      end
    end
    false
  end
  private

  def ordinary_move?(piece,to)
    (forward_move?(piece.position,to) || side_move?(piece.position,to) ||
    diagonal_move?(piece.position,to)) && move_by(piece,to) == 1
  end

  def capture_move?(piece,to)
    ordinary_move?(piece,to) && opponent_from?(piece,to)
  end

  def castling_move?(king,to)
    if side_move?(king.position,to) && king.first_move? &&
        moved_by_two(king,to) && free_way?(king.position,to)
      return false if castling_move_over_attacked_position?(king,to)
      piece = board.value_from(rook_position_next(to))
      if piece != nil && piece.first_move?
        board.move_piece(piece,rook_to_position_next(to,piece))
        return true
      end

    end
    false
  end

  def castling_move_over_attacked_position?(king,to)
    enemies = board.filled_squares.select{|piece| piece.color != king.color}
    castling_path = generate_path(king.position,to) - [king.position]
    attackers = enemies.select{|enemy| enemy.possible_moves.any?{|mv| castling_path.include?(mv)}}
    attackers.any?{|attacker| castling_path.any?{|ps| free_way?(attacker.position,ps)}}
  end

  def rook_position_next(to)
    ["a","h"].select{|f| (f[0].ord - to[0].ord).abs <= 2}[0].concat(to[1])
  end

  def rook_to_position_next(to,rook)
    (rook.position[0] == "h") ? "f".concat(to[1]) : "d".concat(to[1])
  end

  def moved_by_two(piece,to)
    move_by(piece,to).abs == 2
  end

  def move_by(piece,to)
    calc_distance(piece.position,to).abs
  end

end
