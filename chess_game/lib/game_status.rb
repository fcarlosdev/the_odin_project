class GameStatus

  attr_reader :movement, :board

  def initialize(movement,board)
    @movement = movement
    @board = board
  end

  def check?(player)
    king = king_piece(allies_pieces(player))
    enemy_pieces(player).any?{|piece| piece.possible_moves.include?(king.position)}
  end

  def checkmate?(player)
    check?(player) && no_valid_move?(player)
  end

  private

  def no_valid_move?(player)
    get_pieces(true,player.color).all?{|piece| !escape_move?(player,piece)}
  end

  def escape_move?(player,piece)
    piece.possible_moves.flatten.each do |move|
      original_piece,opponent = simulate_move(piece,move)
      if !check?(player)
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
    movement.move(piece,to)
    [original_piece,captured_piece]
  end

  def undo_move(piece,opponent,to)
    board.fill_square(piece.old_position,piece)
    board.fill_square(to,opponent)
  end

  def save_piece(piece)
    Piece.create_piece(piece.type,piece.color,piece.position)
  end

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
