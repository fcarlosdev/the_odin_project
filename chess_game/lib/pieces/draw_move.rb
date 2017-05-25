require_relative "end_game_moves"

class DrawMove < EndGameMoves

  def draw_happened?(king)
    others_intializations(king)
    insufficient_pieces? || stalemate?(king)
  end

  private

  def insufficient_pieces?
    count_black = pieces.count {|piece| piece.color == "black"}
    count_white = pieces.count {|piece| piece.color == "white"}
    (count_black == 1) && (count_white <= 2) || (count_black <= 2) && (count_white == 1)
  end

  def stalemate?(king)

    legal_moves = {}
    king_moves.each do |move|
      opponents_moves.each do |positions|
        opponent = positions[0]
        to = opponent.type[0].upcase+move[1..2]
        legal_move, tmp_piece = any_legal_move?(king,opponent,move)
        legal_moves[to[1..2]] = legal_move if [false,nil].include?(legal_moves[to[1..2]])
        undo_simulate_move(tmp_piece,to)
      end
    end
    legal_moves.all?{|move| move[1] != false}
  end

  def any_legal_move?(king,opponent,king_move)
    simulate_move(opponent,opponent.current_position,opponent.type[0].upcase+king_move[1..2],king)
  end

  def simulate_move(piece,from,to,king)
    tmp_piece = board.value_from(to)
    board.fill_square(to,king)
    [movements.valid_move?(piece,from,to),tmp_piece]
  end

  def undo_simulate_move(piece,position)
    board.fill_square(position,piece)
  end

  def group(opponents, king_moves)
    opponent_moves = opponents.each_with_object({}) do |opponent,group|
      moves = king_moves.map{|move| opponent.get_moves_with(move,opponent.current_position)}.flatten
      group[opponent] = moves if !moves.empty?
    end
  end

  def others_intializations(king)
    @king_moves      = valid_moves(king,movements)
    @opponents_moves = group(opponents,king_moves)
  end

end
