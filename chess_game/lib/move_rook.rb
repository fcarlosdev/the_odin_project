require_relative "modules/distance"

class MoveRook

  include Distance

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)
    if forward_move?(piece,to) || capture_move?(piece,to) || side_move?(piece,to)
      board.move_piece(piece,to)
      return true
    end
    false
  end

  private

  def forward_move?(piece,to)
    piece.forward_moves.include?(to) && empty_place?(to) && free_way?(piece.position,to)
  end

  def capture_move?(piece,to)
    piece.possible_moves.include?(to) && !empty_place?(to) && opponent_place?(to,piece)
  end

  def side_move?(piece,to)
    piece.side_moves.include?(to) && empty_place?(to) && free_way?(piece.position,to)
  end

  def free_way?(from,to)
    (way(from,to) - [from]).all?{|place| empty_place?(place)}
  end

  def way(from,to)
  (from[0] == to[0]) ? forward_way(from,to) : side_way(from,to).map{|file| file.concat(to[1])}
  end

  def forward_way(from,to)
    (from < to) ? (from..to).to_a : (to..from).to_a
  end

  def side_way(from,to)
    (from < to) ? (from[0]..to[0]).to_a : (to[0]..from[0]).to_a
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_place?(to,piece)
    (empty_place?(to)) ? false : board.value_from(to).color != piece.color
  end



end
