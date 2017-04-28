require "./move.rb"

class MoveKing < Move

  def move(piece,from,to)

    if ordinary_move?(piece,from,to)
      update_position_of(piece,from,to)
      return true
    elsif capture_move?(piece,from,to)
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

end
