class MovePawn

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    valid_move = false

    if forward_move?(piece,to) || capture_move?(piece,to)
      valid_move = true
    elsif en_passant_move?(piece,to) && piece.en_passant
      board.clear_square((side_place(piece.position,to)))
      valid_move = true
    end
    board.move_piece(piece,to) if valid_move
    valid_move
  end

  private

  def forward_move?(piece,to)
    piece.possible_forward_move?(to) && free_way?(piece.position,to)
  end

  def capture_move?(piece,to)
    piece.possible_capture_move?(to) && !empty_place?(to) && opponent_place?(to,piece)
  end

  def en_passant_move?(piece,to)
    piece.possible_capture_move?(to) && empty_place?(to) && opponent_next_to?(piece,to)
  end

  def opponent_next_to?(piece,to)
    opponent_place?(side_place(piece.position,to),piece)
  end

  def free_way?(from,to)
    (way(from,to) - [from]).all?{|place| empty_place?(place)}
  end

  def way(from,to)
    (from < to) ? (from..to).to_a : (to..from).to_a
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_place?(to,piece)
    (empty_place?(to)) ? false : board.value_from(to).color != piece.color
  end

  def side_place(from,to)
    to[0]+from[1]
  end

end
