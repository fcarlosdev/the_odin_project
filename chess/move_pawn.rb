require "./move.rb"

class MovePawn < Move

  attr_reader :en_passnt_move

  def move(piece,from,to)
    if valid_move?(piece,from,to)
      update_squares(from,piece,to,@en_passant_move)
      update_en_passant(piece,to)
      return true
    end
    false
  end

  private

  def valid_move?(piece,from,to)
     piece.valid_move?(from,to) &&
     (forward_move?(piece,from,to) || capture_move?(piece,from,to) ||
      en_passant_move?(piece,from,to))
  end

  def forward_move?(piece,from,to)
    !piece.capture_move?(from,to) && empty?(get_piece(to))
  end

  def capture_move?(piece,from,to)
    piece.capture_move?(from,to) && !empty?(get_piece(to))
  end

  def en_passant_move?(piece,from,to)
    @en_passant_move = piece.capture_move?(from,to) && piece.en_passant_allowed
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
    piece.number_of_moves += 1
  end

  def update_en_passant(piece,to)
    if first_move?(piece) && moved_two_squares?(piece)
      set_en_passant_to(adjacent_opponents_from(piece,to),true)
    else
      set_en_passant_to([piece],false)
    end
  end

  def set_en_passant_to(pieces,to_status)
    pieces.each {|piece| piece.en_passant_allowed = to_status}
  end

  def moved_two_squares?(piece)
    piece.moved_by == 2
  end

  def first_move?(piece)
    piece.number_of_moves == 1
  end

  def adjacent_opponents_from(piece,to)
    opponent_pieces_from(piece,to)
  end

  def opponent_pieces_from(to_piece,to)
    adjacent_pieces_from(to).select {|piece| piece.color != to_piece.color}
  end

  def adjacent_pieces_from(to)
    adjacent_squares(to).map {|square| board.get_piece(square)}.compact
  end

  def adjacent_squares(from_square)
    perfix_positions_with("P",squares_at_side_of(from_square))
  end

  def get_side_square(from,to)
    adjacent_squares(from).select {|square| square[1] == to[1]}[0]
  end

end
