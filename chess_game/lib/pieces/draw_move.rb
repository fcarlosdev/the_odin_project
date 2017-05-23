require_relative "end_game_moves"

class DrawMove < EndGameMoves

  def draw_happened?(king)
    others_intializations(king)
    has_no_allies?(king) && not_in_check?(king) && no_legal_move?
  end

  private

  def has_no_allies?(king)
    (pieces - [king]).all?{|piece| piece.color != king.color}
  end

  def not_in_check?(king)
    opponents_moves.all?{|moves| moves[1].all?{|move| board.value_from(move) != king} }
  end

  def no_legal_move?
    opponents_moves.all?{|moves| moves[1] == king_moves}
  end

  def group(opponents, king_moves)
    opponent_moves = opponents.each_with_object({}) do |opponent,group|
      group[opponent] = king_moves.each{|m| opponent.get_moves_with(m,opponent.current_position)}
    end
  end

  def others_intializations(king)
    @king_moves      = valid_moves(king,movements)
    @opponents_moves = group(opponents,king_moves)
  end

end
