class GameStatus

  attr_reader :movement, :board, :allies, :enemies

  def initialize(movement,board)
    @board    = board
    @allies   = []
    @enemies  = []
    @movement = movement
  end

  def check?(player)
    separate_pieces(player) if (@allies.empty? && @enemies.empty?)
    king = get_king_piece
    get_attackers_of(king).any?{|attacker| movement.free_way?(attacker.position,king.position)}
  end

  def checkmate?(player)
    check?(player) && no_valid_move?(player)
  end

  def stalemate?(player)
    !check?(player) && no_valid_move?(player)
  end

  private

  def separate_pieces(player)
    board.filled_squares.each do |piece|
      (piece.color == player.color) ? @allies << piece : @enemies << piece
    end
  end

  def get_attackers_of(piece)
    enemies.select{|attacker| attacker.possible_moves.include?(piece.position)}
  end

  def no_valid_move?(player)
    allies.all?{|piece| !escape_move?(player,piece)}
  end

  def escape_move?(player,piece)
    piece.possible_moves.flatten.each do |move|
      original_piece,opponent,moved = simulate_move(piece,move)
      if !check?(player) && moved
        undo_move(original_piece,opponent,move)
        return true
      end
      undo_move(original_piece,opponent,move)
    end
    false
  end

  def simulate_move(piece,to)
    captured_piece = board.value_from(to)
    original_piece = save_piece(piece)
    [original_piece,captured_piece,movement.move(piece,to)]
  end

  def undo_move(piece,opponent,to)
    board.fill_square(piece.old_position,piece)
    board.fill_square(to,opponent)
  end

  def save_piece(piece)
    Piece.create_piece(piece.type,piece.color,piece.position)
  end

  def get_king_piece
    allies.select{|piece| piece.type == :king}[0]
  end

  def all_pieces
    board.filled_squares
  end

end
