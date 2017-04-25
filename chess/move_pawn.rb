require "./move.rb"

class MovePawn < Move

  def move(piece,from,to)
    if can_move_piece?(piece,from,to)
      update_squares(from,piece,to,en_passant_move?(piece,from,to))
      enable_en_passant(piece,to)
      return true
    end
    false
  end

  private

  def can_move_piece?(piece,from,to)
    forward_move?(piece,from,to) || capture_move?(piece,from,to) ||
    en_passant_move?(piece,from,to)
  end

  def forward_move?(piece,from,to)
    !piece.capture_move?(from,to) && valid_move?(piece,from,to) &&
      empty?(get_piece(to))
  end

  def capture_move?(piece,from,to)
    piece.capture_move?(from,to) && valid_move?(piece,from,to) &&
      !empty?(get_piece(to))
  end

  def en_passant_move?(piece,from,to)
    valid_move?(piece,from,to) && piece.capture_move?(from,to) &&
    piece.en_passant_allowed
  end

  def valid_move?(piece,from,to)
     piece.valid_move?(from,to)
  end

  def empty?(value)
    ["",nil].include?(value)
  end

  def update_squares(from,piece_from,to,en_passant_move=false)
    update_moved_by(piece_from,from,to)
    board.update_square(to,piece_from)
    board.update_square(from,nil)
    board.update_square(get_side_square(from,to),nil) if en_passant_move
  end

  def get_piece(position)
    board.get_piece(position)
  end

  def update_moved_by(piece,from,to)
    piece.moved_by = rank_distance(from,to)
  end

  def moved_two_squares?(piece)
    piece.moved_by == 2
  end

  def first_move?(piece)
    piece.number_of_moves == 1
  end

  def enable_en_passant(piece,to)
    if first_move?(piece) && moved_two_squares?(piece)
      adjacent_opponents_from(piece,to).each {|op| op.en_passant_allowed = true}
    else
      piece.en_passant_allowed = false
    end
  end

  def adjacent_opponents_from(piece,to)
    opponent_pieces(adjacent_pieces_from(adjacent_squares(to)),piece)
  end

  def opponent_pieces(pieces,from_piece)
    pieces.select {|piece| piece.color != from_piece.color}
  end

  def adjacent_pieces_from(squares)
    squares.map {|square| board.get_piece(square)}.compact
  end

  def adjacent_squares(from_square)
    perfix_positions_with("P",squares_at_side_of(from_square))
  end

  def get_side_square(from,to)
    adjacent_squares(from).select {|square| square[1] == to[1]}[0]
  end

end
