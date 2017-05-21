
module CheckmateMove

  def checkmate_move?(king,king_moves,opponents,board)
    captured = king_captured?(king,opponent_positions(king_moves,opponents),board)
    no_scape = no_scape_move?(king_moves,opponent_positions(king_moves,opponents))
    captured && no_scape
  end

  def opponent_positions(king_moves,between_pieces)
    between_pieces.map {|piece| positions_with(king_moves,piece)}.flatten.uniq
  end

  def positions_with(king_moves,opponent)
    king_moves.map {|m| opponent.get_moves_with(m,opponent.current_position)}
  end

  def no_scape_move?(king_moves,from_opponents_moves)
    king_moves.all?{|m| from_opponents_moves.any?{|v| v[1..2] = m[1..2]} }
  end

  def king_captured?(king,on_opponents_moves,board)
    on_opponents_moves.any?{|v| board.value_from(v) == king}
  end

end
