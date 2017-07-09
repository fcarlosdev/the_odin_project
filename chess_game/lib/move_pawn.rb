require "./lib/move_piece"

class MovePawn < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    # puts "Possible moves #{piece.possible_moves}"
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
      side_position = (to[0].concat(pawn.position[1]))
      enemy = board.value_from(side_position)
      return opponent_from?(pawn,side_position) &&
             enemy.moved_by(enemy.old_position,side_position) == 2
    end
    false
  end

  def enemy_moved_by(from,to)
    calc_distance(from,to).abs
  end

end
