
class MoveBishop

  attr_reader :board, :default_moves

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    @default_moves = piece.possible_moves

    if ordinary_move?(piece,to) || capture_move?(piece,to)
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def ordinary_move?(piece,to)
    piece.possible_moves.include?(to) && empty_place?(to) && free_way?(piece.position,to)
  end

  def capture_move?(piece,to)
    piece.possible_moves.include?(to) && !empty_place?(to) && opponent_place?(to,piece)
  end

  def free_way?(from,to)
    way(from,to).all?{|place| empty_place?(place)}
  end

  def way(from,to)
    default_moves.select{|place| (from < to) ? place > from : place < from}
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_place?(to,piece)
    (empty_place?(to)) ? false : board.value_from(to).color != piece.color
  end

end
