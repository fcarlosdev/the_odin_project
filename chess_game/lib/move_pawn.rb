require "./lib/move_piece"

class MovePawn < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      if ordinary_move?(piece,to) || capture_move?(piece,to)
        board.move_piece(piece,to)
        return true
      elsif en_passant_move?(piece,to)
        board.move_piece(piece,to)
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
      if enemy_type_pawn?(enemy) && opponent_from?(pawn,enemy.position) &&
         enemy_moved_two_positions?(enemy)
        board.clear_square(enemy_at)
        return true
      end
    end
    false
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
