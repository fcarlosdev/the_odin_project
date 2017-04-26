require "./move.rb"

class MoveKing < Move

  def move(piece,from,to)

    if ordinary_move?(piece,from,to)
      update_squares(piece,from,to)
      return true
    elsif capture_move?(piece,from,to)

    end
    false
  end

  private

  def ordinary_move?(piece,from,to)
    piece.valid_move?(from,to) && board.get_piece(to) == nil
  end

  def capture_move?(piece,fom,to)
    piece.valid_move?(from,to) && board.get_piece(to) != nil
  end

  def update_squares(piece,from,to)
    board.update_square(to,piece)
    board.update_square(from,nil)
  end

end
