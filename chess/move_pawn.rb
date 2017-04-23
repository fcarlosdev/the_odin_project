require "./move.rb"

class MovePawn < Move

  def move(piece,from,to)

    if can_move_piece?(piece,from,to)
      update_moved_by(piece,from,to)
      update_squares(from,piece,to)
      true
    else
      false
    end

  end

  private

  def can_move_piece?(piece,from,to)
    forward_move?(piece,from,to) || capture_move?(piece,from,to) ||
      en_passant?(piece,from,to)
  end

  def forward_move?(piece,from,to)
    !piece.capture_move?(from,to) && valid_move?(piece,from,to) &&
      empty?(get_piece(to))
  end

  def capture_move?(piece,from,to)
    piece.capture_move?(from,to) && valid_move?(piece,from,to) &&
      !empty?(get_piece(to))
  end

  def en_passant?(piece,from,to)
    pieces = pieces_at_sides(from)
    opponent_pieces?(piece,pieces) && any_moved_two_squares?(pieces,from,to) &&
      any_first_move?(pieces)
  end

  def valid_move?(piece,from,to)
     piece.valid_move?(from,to)
  end

  def empty?(value)
    ["",nil].include?(value)
  end

  def update_squares(from,value_from, to)
    board.update_square(to,value_from)
    board.update_square(from,nil)
  end

  def get_piece(position)
    board.get_piece(position)
  end

  def pieces_at_sides(from)
    squares_at_side(from).map {|position| board.get_piece(position)}.compact
  end

  def squares_at_side(from)
    perfix_position_with("P",squares_at_side_of(from))
  end

  def opponent_pieces?(from_piece,pieces)
    pieces.all? {|piece| piece.color != from_piece.color }
  end

  def any_moved_two_squares?(pieces,from,to)
    pieces.any?{|piece| piece.moved_by == 2}
  end

  def any_first_move?(pieces)
    pieces.any? {|piece| piece.number_of_moves == 1}
  end

  def update_moved_by(piece,from,to)
    piece.moved_by = rank_distance(from,to)
  end



end
