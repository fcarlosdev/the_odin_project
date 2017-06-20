
class MoveQueen

  attr_reader :board, :diagonal_positions

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    @diagonal_positions = piece.diagonal_moves

    if piece.forward_moves.include?(to) && board.empty_square?(to) && free_way?(piece.position,to)
      board.move_piece(piece,to)
      return true
    elsif piece.side_moves.include?(to) && board.empty_square?(to) && free_way?(piece.position,to)
      board.move_piece(piece,to)
      return true
    elsif piece.diagonal_moves.include?(to) && board.empty_square?(to) && free_way?(piece.position,to)
      board.move_piece(piece,to)
      return true
    elsif piece.forward_moves.include?(to) && !board.empty_square?(to) &&
      (board.value_from(to).color != piece.color) && free_way?(piece.position,to)
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def possible_move?(piece,to)
    piece.possibles.include?(to)
  end


  def free_way?(from,to)
    (way(from,to) - [from,to]).all?{|place| empty_place?(place)}
  end

  def way(from,to)
    return forward_way(from,to) if (from[0] == to[0])
    return side_way(from,to).map{|file| file.concat(to[1])} if (from[0] != to[0] && from[1] == to[1])
    return diagonal_way(from,to) if (from[0] != to[0] && from[1] != to[1])
  end

  def forward_way(from,to)
    (from < to) ? (from..to).to_a : (to..from).to_a
  end

  def side_way(from,to)
    (from < to) ? (from[0]..to[0]).to_a : (to[0]..from[0]).to_a
  end

  def diagonal_way(from,to)
    diagonal_positions.select{|place| (from < to) ? place > from : place < from}
  end


  def empty_place?(to)
    board.empty_square?(to)
  end

end
