class MovePawn

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      can_move = (forward_move?(piece,to) || capture_move?(piece,to) ||
                  en_passant_move?(piece,to))
      board.move_piece(piece,to) if can_move
    end
    can_move
  end

  private

  def forward_move?(piece,to)
    piece.forward_move?(to) && board.empty_square?(to)
  end

  def capture_move?(piece,to)
    piece.capture_move?(to) && !board.empty_square?(to)
  end

  def en_passant_move?(piece,to)
    if piece.capture_move?(to)
      enemy = board.value_from(to[0]+piece.position[1])
      if (!enemy.nil? && enemy.first_move?)
          board.clear_square(enemy.position)
          return true
      end
    end
    false
  end

end
