class GameStatus

  attr_reader :movement, :board

  def initialize(movement,board)
    @movement = movement
    @board = board
  end

  def check?(player)
    king_attacked?(enemy_pieces(player),king_piece(player))
  end

  def checkmate?(player)
    check?(player) && no_escape?(player)
  end

  def stalemate?(player)
    !check?(player) && no_escape?(player)
  end

  private

  def enemy_pieces(player)
    pieces_of(get_opponent_color(player))
  end

  def pieces_of(color)
    board.filled_squares.select{|square| square.color == color}
  end

  def get_opponent_color(to_player)
    [:white,:black].find{|color| color != to_player.color}
  end

  def enemy_pieces_moves(player)
    enemy_pieces(player).map{|enemy| enemy.possible_moves}.flatten.uniq
  end

  def king_piece(player)
    pieces_of(player.color).select{|piece| piece.type == :king}[0]
  end

  def king_moves(king)
    movement.valid_moves(king).flatten
  end

  def no_escape?(player)
    king_moves(king_piece(player)).all?{|move| enemy_pieces_moves(player).include?(move)}
  end

  def king_attacked?(enemies,king)
    enemies.any?{|piece| piece.possible_moves.include?(king.position)}
  end


end
