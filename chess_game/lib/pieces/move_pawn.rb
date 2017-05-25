require_relative "move"

class MovePawn < Move

  def move(piece,from,to)
    if right_direction?(piece,from,to) && can_move?(piece,from,to)
      update_position_of(piece,from,to)
      update_current_position(piece,to)
      switch_en_passant_status(piece,from,to)
      update_number_of_moves(piece)
      return true
    end
    false
  end

  def can_move?(piece,from,to)
    ordinary_move?(piece,from,to) || capture_move?(piece,from,to) || en_passant_move?(piece,from,to)
  end

  private

  def ordinary_move?(piece,from,to)
    piece.valid_move?(from,to) && empty_square?(to) && !piece.capture_move?(from,to)
  end

  def capture_move?(piece,from,to)
    piece.capture_move?(from,to) && !empty_square?(to) && opponent_of?(piece,to)
  end

  def en_passant_move?(piece,from,to)
    if piece.en_passant_allowed
      update_en_passant_position(from,to)
      update_en_passant_status([piece],false)
      return true
    end
    return false
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

  def switch_en_passant_status(piece,from,to)
    if piece.number_of_moves == 0 && calc_distance(from,to).abs == 2
      update_en_passant_status(pices_at_files(to),true)
    else
      board.squares_with_pieces.each do |ally|
        if ally.color == piece.color
          update_en_passant_status([ally],false)
        end
      end
    end
  end

  def update_en_passant_status(to_pieces,enable)
    pieces = to_pieces.select{|piece| piece.type == :pawn}
    pieces.each {|piece| piece.en_passant_allowed = enable if !piece.nil?}
  end

  def pices_at_files(from)
    side_files(from).map {|square| board.value_from(square)}.compact
  end

  def side_files(from)
    perfix_positions_with("P",squares_at_side_of(from))
  end

  def update_number_of_moves(piece)
    piece.update_number_of_moves
  end

  def update_en_passant_position(from,to)
    board.fill_square(get_piece_on_same_file(from,to)[0].current_position,nil)
  end

  def get_piece_on_same_file(from,to)
    pices_at_files(from).select {|piece| piece.current_position[1] == to[1]}
  end

end
