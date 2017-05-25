require_relative "end_game_moves"

class DrawMove < EndGameMoves

  def draw_happened?(king)
    others_intializations(king)

    # allies_pieces = pieces.select{|piece| (piece.type != :king && piece.color == king.color)}
    # puts "Allies pieces from #{king}"
    # allies_pieces.each do |ally|
    #   moves = valid_moves(ally,movements).uniq
    #   puts "Moves = #{moves}"
    #   puts "#{ally.type} (Valid moves) => #{moves.empty?}"
    # end

    # no_moves = allies_pieces.all?{|piece| valid_moves(piece,movements).uniq.empty?}

    # enemies = opponents_from(king,pieces)
    # puts "Enemies = #{enemies}"
    # enemies.each do |enemy|
    #   moves = valid_moves(enemy,movements)
    #   puts "Enemy #{enemy.type} => #{moves}"
    # end

    # any_attack_move = enemies.any?{|enemy| valid_moves(enemy,movements).uniq.any?{|move| move[1..2] == king.current_position[1..2]}}
    # puts "Any attack = #{any_attack_move}"

    # puts "No moves = #{no_moves}"
    # no_moves && !any_attack_move

    stalemate?(king)
  end

  def stalemate?(king)

    #TODO Refactoy this method, because it has at least three situations of draw no
    # only stalemate

    # Here the case of draw when there is no sufficient pieces on the board.
    count_black = 0
    pieces.each do |piece|
      count_black += 1 if piece.color == "black"
    end


    count_white = 0
    pieces.each do |piece|
      count_white += 1 if piece.color == "white"
    end

    if (count_black == 1) && (count_white <= 2)
      return true
    elsif (count_black <= 2) && (count_white == 1)
      return true
    end

    # this logic have to be moved to board, because the king can't move to a possible check position.
    check = opponents_moves.any?{|moves|
      moves[1].any?{|move|
        move[1..2] == king.current_position[1..2] && !movements.piece_between?(moves[0].current_position,king.current_position)
        }
    }

    # This method is making two tests one to see if when a king go to one position, the opponents_moves
    # can capture it at that postion, and the other tests is about the king piece has any escape move.
    reachable = []
    legal_moves = {}
    king_moves.each do |move|
      opponents_moves.each do |positions|
        positions[1].each do |position|
          equal = position[1..2] == move[1..2]
          reachable << equal if equal == true

          from = positions[0].current_position
          to = positions[0].type[0].upcase+move[1..2]
          if from != to
            tmp_piece = board.value_from(to)
            board.fill_square(to,king)
            can_move = movements.valid_move?(positions[0],from,to)
            if legal_moves[to[1..2]] == nil
              legal_moves[to[1..2]] = can_move
            elsif legal_moves[to[1..2]] == false
              legal_moves[to[1..2]] = can_move
            end
            board.fill_square(to,tmp_piece)
            break if can_move == true
          end
        end
      end
    end

    has_escape_move = legal_moves.any?{|move| move[1] == false}

    can_be_reach = reachable.any?{|legal| legal == false}

    !check && !can_be_reach && !has_escape_move
  end

  private

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
