require "./move.rb"

class MoveKing < Move

  SQUARES_OF_CASTLING = 2
  ROOK_POSITIONS = ["Ra1","Ra7", "Rh1", "Rh7"]

  def move(piece,from,to)
    if ordinary_move?(piece,from,to) ||  capture_move?(piece,from,to) ||
       castling_move?(piece,from,to)
      update_position_of(piece,from,to)
      return true
    end
    false
  end

  private

  def ordinary_move?(piece,from,to)
    piece.valid_move?(from,to) && empty_square?(to)
  end

  def capture_move?(piece,from,to)
    piece.valid_move?(from,to) && !empty_square?(to) && opponent_of?(piece,to)
  end

  def castling_move?(piece,from,to)

    if moved_two_squares?(from,to)
      rook_from = rook_position(from,to)
      rook_to = move_rook_to(from,to)
      if first_move?(from) && !empty_square?(rook_from) && first_move?(rook_from)
        update_position_of(board.get_piece(rook_from),rook_from,rook_to)
        return true
      end
    end
    false
  end

  def moved_two_squares?(from,to)
    (calc_distance(from,to)).abs == SQUARES_OF_CASTLING
  end

  def first_move?(from)
    board.get_piece(from).first_move
  end

  def rook_position(from,to)
    ROOK_POSITIONS.find {|rook| rook[2] == to[2] && side(direction(from,to),rook[1],to[1])}
  end

  def side(direction,rook,to)
    direction == :LEFT ? rook < to : rook > to
  end

  def direction(from,to)
    calc_distance(from,to) == -SQUARES_OF_CASTLING ? :LEFT : :RIGHT
  end

  def move_rook_to(from,to)
    factor = calc_distance(from,to) == -SQUARES_OF_CASTLING ? 3 : -2
    (factor != 0) ? prefix_position_with("R",move_by(factor,rook_position(from,to))) : ""
  end

end
