class MovePawn < MovePiece

  def initialize(board)
    @board = board
  end

  def move(piece,to)
    #Missed the promotion move.

    if piece.possible_move?(to)
      if ordinary_move?(piece,to) || capture_move?(piece,to) || en_passant_move?(piece,to)
        if !promotion?(piece,to)
          board.move_piece(piece,to)
        else
          board.clear_square(piece.position)
        end
        return true
      end
    end
    false
  end

  private

  def ordinary_move?(piece,to)
    forward_move?(piece.position,to) && empty_place?(to)
  end

  def capture_move?(piece,to)
    diagonal_move?(piece.position,to) && opponent_from?(piece,to)
  end

  def en_passant_move?(pawn,to)
    if diagonal_move?(pawn.position,to) && empty_place?(to)
      enemy_at = side_position(pawn.position,to)
      enemy = value_from(enemy_at)
      if enemy != nil && enemy_type_pawn?(enemy) && opponent_from?(pawn,enemy.position) &&
         enemy_moved_two_positions?(enemy)
        board.clear_square(enemy_at)
        return true
      end
    end
    false
  end

  def promotion?(piece,to)
    promoted = false
    if (piece.color == :white && to[1].to_i == 8) || (piece.color == :black && to[1].to_i == 1)
      puts "Promove the pawn piece to :Q(queen), N(Knight), R(Rook) or B(Bishop)"
      promote_to = gets.chomp.upcase
      case promote_to
        when "Q"
          promoted_piece = Piece.create_piece(:queen,piece.color,to)
          promoted = true
        when "N"
          promoted_piece = Piece.create_piece(:knight,piece.color,to)
          promoted = true
        when "R"
          promoted_piece = Piece.create_piece(:rook,piece.color,to)
          promoted = true
        when "B"
          promoted_piece = Piece.create_piece(:bishop,piece.color,to)
          promoted = true
      end
      board.fill_square(to,promoted_piece) if promoted
    end
    promoted
  end

  def enemy_moved_by(from,to)
    calc_distance(from,to).abs
  end

  def side_position(from,to)
    (to[0].concat(from[1]))
  end

  def enemy_type_pawn?(enemy)
    enemy.type == :pawn
  end

  def value_from(position)
    board.value_from(position)
  end

  def enemy_moved_two_positions?(enemy)
    enemy.moved_by(enemy.old_position,enemy.position) == 2
  end


end
