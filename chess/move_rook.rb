require "./move.rb"

class MoveRook < Move

  def move(piece,from,to)
    if ordinary_move?(piece,from,to)
      move_rook(piece,from,to)
      return true
    elsif capture_move?(piece,from,to)
      board.get_piece(to).color != piece.color
      move_rook(piece,from,to)
      return true
    end
    false
  end

  private

  def ordinary_move?(piece,from,to)
    piece.valid_move?(from,to) && empty?(get_piece(to))
  end

  def capture_move?(piece,from,to)
    piece.valid_move?(from,to) && !empty?(get_piece(to)) &&
    opponent_piece?(piece,to)
  end

  def move_rook(piece,from,to)
    board.update_square(to,piece)
    board.update_square(from,nil)
  end

  def get_piece(position)
    board.get_piece(position)
  end

  def empty?(value)
    ["",nil].include?(value)
  end

  def opponent_piece?(piece,to)
    !get_piece(to).color.eql?(piece.color)
  end


end
