require "./lib/move_piece"

class MoveKing < MovePiece

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    puts "Possible side moves #{piece.side_moves}"

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
    piece.forward_move?(to)
  end

  def side_move?(piece,to)
    if calc_distance(piece.position,to).abs == 2
      # puts "Castling move, moves #{piece.moves} #{piece.moves == 0}"
      # puts "First move #{piece.first_move?}"
      # puts "Free way #{free_way?(piece,to)}"
    end
    return true if piece.side_move?(to) && calc_distance(piece.position,to).abs == 1
    return true if piece.side_move?(to) && piece.moves == 0 && free_way?(piece,to)
    false
  end

  def diagonal_move?(piece,to)
    piece.diagonal_move?(to)
  end

  def capture_move?(piece,to)
    piece.possible_move?(to) && opponent_to?(piece,to)
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_to?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

end
