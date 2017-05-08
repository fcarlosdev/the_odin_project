require_relative "move"

class MovePawn < Move

  def move(piece,from,to)
    if right_direction?(piece,from,to) && can_move?(piece,from,to)
      update_position_of(piece,from,to)
      set_moved_by(piece,from,to)
      disable_en_passant(piece)
      update_position(piece,to)
      return true
    end
    false
  end

  private

  def can_move?(piece,from,to)
    ordinary_move?(piece,from,to) || capture_move?(piece,from,to) || en_passant_move?(piece,from,to)
  end

  def ordinary_move?(piece,from,to)
    piece.valid_move?(from,to) && empty_square?(to) && !piece.capture_move?(from,to)
  end

  def capture_move?(piece,from,to)
    piece.capture_move?(from,to) && !empty_square?(to) && opponent_of?(piece,to)
  end

  def en_passant_move?(piece,from,to)
    if piece.en_passant_allowed && en_passant_ok?(piece,from,to,opponent_at(to,from))
      update_squares_en_passant_move(piece,from,to)
      return true
    end
    false
  end

  def en_passant_ok?(piece,from,to,opponent)
    opponent != nil && opponent.first_move &&
        opponent.moved_by == 2 && piece.capture_move?(from,to)
  end

  def right_direction?(piece,from,to)
    north_direction?(piece,from,to) || south_direction?(piece,from,to)
  end

  def north_direction?(piece,from,to)
    calc_distance(from,to) > 0 && piece.move_direction.eql?(:NORTH)
  end

  def south_direction?(piece,from,to)
    calc_distance(from,to) < 0 && piece.move_direction.eql?(:SOUTH)
  end

  def opponent_at(side,from)
    board.value_from(prefix_position_with('P',select_square(side,from)[0]))
  end

  def select_square(at_side,from)
    squares_at_side_of(from).select {|s| s[0] == at_side[1] }
  end

  def set_moved_by(piece,from,to)
    piece.moved_by = rank_distance(from,to)
    if (piece.moved_by == 2 && piece.first_move)
      enable_en_passant_to_opponents(piece,to)
    end
  end

  def enable_en_passant_to_opponents(from_piece,at)
    squares_at_side_of(at).each do |s|
      opponent = board.value_from(prefix_position_with('P',s))
      if (!opponent.nil? && opponent.color != from_piece.color)
        opponent.en_passant_allowed = true
      end
    end
  end

  def update_squares_en_passant_move(piece,from,to)
    board.fill_square(prefix_position_with('P',select_square(to,from)[0]),nil)
  end

  def disable_en_passant(piece)
    board.squares.each do |row|
      row.each do |square|
        if square != nil && square.type == piece.type && square.color == piece.color
          square.en_passant_allowed = false
        end
      end
    end
  end

end
