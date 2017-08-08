class GameStatus

  attr_reader :movement, :board, :player_pieces, :enemy_pieces

  def initialize(movement,board)
    @movement = movement
    @board = board
  end

  def check?(player)
    king = king_piece(allies_pieces(player))
    enemy_pieces(player).any?{|piece| piece.possible_moves.include?(king.position)}
  end

  # How to Checkmate in Chess
  # The purpose of the game is to checkmate the opponent's king. This happens when
  # the king is put into check and cannot get out of check. There are only three
  # ways a king can get out of check: move out of the way (though he cannot castle!),
  # block the check with another piece, or capture the piece threatening the king.
  # If a king cannot escape checkmate then the game is over. Customarily the king
  # is not captured or removed from the board, the game is simply declared over.
  def checkmate?(player)
    if check?(player)

      player_pieces = get_pieces(true,player.color)

      king = get_piece(:king,player_pieces)
      attackers_king = get_pieces(false,player.color).select{|piece| piece.possible_moves.include?(king.position)}

      # puts "King #{king.inspect}, Attackers #{attackers_king}"

      #king can move out of the way?
      result = movement.valid_moves(king).any?{|move| attackers_king.all?{|attacker| !attacker.possible_moves.include?(move)}}
      # puts "Result #{result}"

      # King can capture attacker
      captured = movement.valid_moves(king).all?{|move| attackers_king.all?{|attacker| attacker.position == move}}
      # puts "Captured #{captured}"

      #Can block attacker with another piece
      (player_pieces - [king]).each do |piece|
        movement.valid_moves(piece).each do |move|
          movement.move(piece,move,true)
          attackers_king.each do |attacker|
            tmp_path = movement.generate_path(attacker.position,king.position) - [attacker.position]
            path = (attacker.position > tmp_path[0]) ? tmp_path.reverse : tmp_path
            return false if path.any?{|position| !movement.move(attacker,position,true)}
          end
        end

      end

      return true
    end

    false

  end

  private

  def allies_pieces(player)
    get_pieces(true,player.color)
  end

  def enemy_pieces(player)
    get_pieces(false,player.color)
  end

  def king_piece(player_pieces)
    get_piece(:king,player_pieces)
  end

  def get_pieces(same_color_of,color)
    all_pieces.select {|piece| (same_color_of) ? piece.color == color : piece.color != color}
  end

  def get_piece(type,from_pieces)
    from_pieces.find{|piece| piece.type == type}
  end

  def all_pieces
    board.filled_squares
  end

end
