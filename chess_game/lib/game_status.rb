class GameStatus

  attr_reader :movement, :board, :allies, :enemies

  def initialize(movement,board)
    @board    = board
    @allies   = []
    @enemies  = []
    @movement = movement
  end

  def check?(player)
    @allies = get_pieces(player.color)
    @enemies = get_pieces(other_player(player))

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

  def no_valid_move?(player)
    allies.each do |ally|
      old_place = ally.position
      movement.valid_moves(ally).each do |place|
        if !movement.generate_path(old_place,place).empty?
          args = simulate_move(ally,ally.moves, place)
          args[:old_position] = old_place
          if args[:move_ok] && !check?(player)
            undo_move(args)
            return false
          end
          undo_move(args)
        end
      end
    end
    true
  end

  def simulate_move(piece,moves,to)
    piece_at = board.value_from(to)
    moved = movement.move(piece,to)
    args = {piece: piece, moves: moves, enemy_piece: piece_at, enemy_at: to,
            move_ok: moved}
  end

  def undo_move(args ={})
    piece = args[:piece]
    board.fill_square(args[:old_position],piece)
    piece.position = args[:old_position]
    piece.moves = args[:moves]
    board.fill_square(args[:enemy_at],args[:enemy_piece])
  end

  def get_attackers_of(piece)
    enemies.select{|attacker| attacker.possible_moves.include?(piece.position)}
  end

  def save_piece(piece)
    Piece.create_piece(piece.type,piece.color,piece.position)
  end

  def get_king_piece
    allies.select{|piece| piece.type == :king}[0]
  end

  def get_pieces(color)
    board.filled_squares.select{|piece| piece.color == color}
  end

  def other_player(player)
    player.color == :white ? :black : :white
  end

end
