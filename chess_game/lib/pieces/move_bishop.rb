require_relative "move"

class MoveBishop < Move

  def move(piece,from,to)
    if can_move?(piece,from,to)
      update_position_of(piece,from,to)
      update_current_position(piece,to)
      return true
    end
    false
  end

  def can_move?(piece,from,to)
    !has_piece_between?(piece,from,to) && can_move_piece?(piece,from,to)
  end

  private

  def has_piece_between?(piece,from,to)
    diagonals = perfix_positions_with("B",diagonals_between(from,to))
    (!diagonals.empty?) ? any_position_filled?(diagonals) : super(piece,from,to)
  end

  def ordinary_move?(piece,from,to)
    valid_move?(piece,from,to) && empty_square?(to)
  end

  def capture_move?(piece,from,to)
    valid_move?(piece,from,to) && !empty_square?(to) && opponent_of?(piece,to)
  end

  def valid_move?(piece,from,to)
    piece.valid_move?(from,to)
  end

  def can_move_piece?(piece,from,to)
    ordinary_move?(piece,from,to) || capture_move?(piece,from,to)
  end

end
