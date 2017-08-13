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
      initial_place = ally.position
      movement.valid_moves(ally).each do |place|
        if !movement.generate_path(initial_place,place).empty?
          ally, enemy, moved = simulate_move(ally,place)
          if moved && !check?(player)
            undo_move(ally,initial_place,enemy,place)
            return false
          end
          undo_move(ally,initial_place,enemy,place)
        end
      end
    end
    true
  end

  def simulate_move(piece,to)
    piece_at = board.value_from(to)
    moved = movement.move(piece,to)
    [piece,piece_at,moved]
  end

  def undo_move(piece,initial_place, enemy,at)
    board.fill_square(initial_place,piece)
    piece.position = initial_place
    piece.moves = 0
    board.fill_square(at,enemy)
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
