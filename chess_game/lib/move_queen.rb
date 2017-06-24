
class MoveQueen

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)
    if (ordinary_move?(piece,to) && !opponent_to?(piece,to)) || capture_move?(piece,to)
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def ordinary_move?(piece,to)
    forward_move?(piece,to) || side_move?(piece,to) || diagonal_move?(piece,to)
  end

  def forward_move?(piece,to)
    piece.forward_move?(to) && free_way?(fd_path(piece,to))
  end

  def side_move?(piece,to)
    piece.side_move?(to) && free_way?(sd_path(piece,to))
  end

  def diagonal_move?(piece,to)
    piece.diagonal_move?(to) && free_way?(dg_path(piece,to))
  end

  def capture_move?(piece,to)
    piece.possible_move?(to) && opponent_to?(piece,to) && free_caputure_path?(piece,to)
  end

  def free_way?(path)
    path.all?{|place| empty_place?(place)}
  end

  def fd_path(piece,to)
    inner_path(extract_path(piece.position,to,piece.forward_moves))
  end

  def sd_path(piece,to)
    inner_path(extract_path(piece.position,to,piece.side_moves))
  end

  def dg_path(piece,to)
    extract_path(piece.position,to,piece.diagonal_moves)
  end

  def extract_path(from,to,positions)
    positions.select{|place| (from < to) ? (place > from && place < to): (place < from && place > to)}
  end

  def free_caputure_path?(piece,to)
    free_way?(fd_path(piece,to)) || free_way?(sd_path(piece,to)) || free_way?(dg_path(piece,to))
  end

  def inner_path(path)
    path.slice(1..path.length-2)
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

end
