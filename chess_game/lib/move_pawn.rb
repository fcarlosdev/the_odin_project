require "./lib/modules/coordenates"

class MovePawn

  include Coordenates

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move(piece,to)

    if piece.possible_move?(to)
      if forward_move?(piece,to) || capture_move?(piece,to) || en_passant_move?(piece,to)
        board.move_piece(piece,to)
        return true
      end
    end

    false
  end

  private

  def forward_move?(piece,to)
    piece.forward_move?(to) && empty_position?(to)
  end

  def capture_move?(piece,to)
    piece.capture_move?(to) && !empty_position?(to) && enemy_at?(to,piece)
  end

  def en_passant_move?(piece,to)
    piece.capture_move?(to) && empty_position?(to) &&
      has_side_enemy?(piece) && first_move?(to[0]+piece.position[1])
  end

  def empty_position?(at)
    board.empty_square?(at)
  end

  def enemy_at?(to,piece)
    board.value_from(to).color != piece.color
  end

  def first_move?(piece_at)
    board.value_from(piece_at).first_move?
  end

  def has_side_enemy?(piece)
    side_pieces(piece).any? { |pc| pc.color != piece.color}
  end

  def side_pieces(piece)
    side_positions(piece).map{|place| board.value_from(place)}.compact
  end

  def side_positions(piece)
    squares_at_side_of(piece.position)
  end



end
