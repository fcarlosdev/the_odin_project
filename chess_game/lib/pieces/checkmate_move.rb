module CheckmateMove

  def checkmate_move?(king,opponents,board,movements)
    king_moves = valid_moves(king,movements)
    moves      = opponent_positions(king_moves,opponents)
    king_captured?(king,moves,board) && no_scape_move?(king_moves,moves,king,movements,opponents) &&
    king_on_capture_position?(king,king_moves,opponents,movements,moves)
  end

  def opponent_positions(king_moves,between_pieces)
    between_pieces.map {|piece| positions_with(king_moves,piece)}.flatten.uniq
  end

  def positions_with(king_moves,opponent)
    king_moves.map {|m| opponent.get_moves_with(m,opponent.current_position)}
  end

  def king_captured?(king,on_opponents_moves,board)
    on_opponents_moves.any?{|v| board.value_from(v) == king}
  end

  def no_scape_move?(king_moves,opponents_moves,king,movements,opponents)
    all_moves_in_check?(king_moves,opponents_moves) &&
    king_on_capture_position?(king,king_moves,opponents,movements,opponents_moves)
  end

  def all_moves_in_check?(king_moves,opponents_moves)
    king_moves.all?{|m| opponents_moves.any?{|v| v[1..2] = m[1..2]} }
  end

  def king_on_capture_position?(king,king_moves,opponents,movements,opponents_moves)
     associate(opponents_moves,opponents).all?{|piece| any_capturable_move?(piece,king_moves,movements)}
  end

  def any_capturable_move?(piece,king_moves,movements)
    king_moves.any?{|move| valid_move?(piece[0],(piece[0].type[0].upcase+move[1..2]),movements)}
  end

  def associate(opponents_moves,to_opponents)
    to_opponents.each_with_object({}) do |opponent, group|
      values = opponents_moves.select{|position| position.start_with?(opponent.type[0].upcase)}
      group[opponent] = values if !values.empty?
    end
  end

end
