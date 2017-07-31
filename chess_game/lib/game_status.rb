class GameStatus

  attr_reader :movement, :board

  def initialize(movement,board)
    @movement = movement
    @board = board
  end

  def check?(player)
    attacker_pieces = get_pieces(player.color)
    attacked_pieces = get_pieces(get_opponent_color(player))
    attacked_king = attacked_pieces.select{|piece| piece.type == :king}
    attacker_pieces.any?{|attacker| attacker.possible_moves.include?(attacked_king[0].position)}
  end

  private

  def get_pieces(color)
    board.filled_squares.select{|square| square.color == color}
  end

  def get_opponent_color(to_player)
    [:white,:black].find{|color| color != to_player.color}
  end

end
