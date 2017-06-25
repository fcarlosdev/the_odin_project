
class MoveBishop

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if diagonal_move?(piece,to) || capture_move?(piece,to)
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def diagonal_move?(piece,to)
    piece.possible_move?(to) && free_way?(dg_path(piece,to)) && !opponent_to?(piece,to)
  end

  def capture_move?(piece,to)
    piece.possible_move?(to) && opponent_to?(piece,to) && free_caputure_path?(piece,to)
  end

  def free_way?(path)
    (!path.nil?) ? path.all?{|place| empty_place?(place)} : true
  end

  def dg_path(piece,to)
    extract_path(piece.position,to,piece.possible_moves)
  end

  def extract_path(from,to,positions)
    positions.select{|place| (from < to) ? (place > from && place < to): (place < from && place > to)}
  end

  def free_caputure_path?(piece,to)
    free_way?(dg_path(piece,to))
  end

  def inner_path(path)
    (path.length >= 2) ? path.slice(1..path.length-2) : path
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

end
