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
      initial = ally.position
      movement.valid_moves(ally).each do |move|
        if !movement.generate_path(initial,move).empty?
          enemy_piece = board.value_from(move)
          movement.move(ally,move)
          if !check?(player)
            board.fill_square(initial,ally)
            ally.position = initial
            ally.moves = 0
            board.fill_square(move,enemy_piece)
            return false
          end
          board.fill_square(initial,ally)
          ally.position = initial
          ally.moves = 0
          board.fill_square(move,enemy_piece)
        end
      end
    end
    true
  end

  # def simulate_move(piece,to)
  #   captured_piece = board.value_from(to)
  #   original_piece = save_piece(piece)
  #   [original_piece,captured_piece,movement.move(piece,to)]
  # end
  #
  # def undo_move(piece,opponent,to)
  #   board.fill_square(piece.old_position,piece)
  #   board.clear_square(to)
  #   board.fill_square(to,opponent)
  # end

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
