require_relative "modules/distance"
require "./lib/move_pawn"

class Pieces

  include Distance

  PIECES_IMAGES = { white: { king:   "\u2654", queen:  "\u2655", rook: "\u2656",
                             bishop: "\u2657", knight: "\u2658", pawn: "\u2659" },
                    black: { king:   "\u265a", queen:  "\u265b", rook: "\u265c",
                             bishop: "\u265d", knight: "\u265e", pawn: "\u265f" }
                   }
  PIECE_MOVERS = { pawn: MovePawn }

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def self.create_piece(type,color,at)
    case type
    when :pawn   then Pawn.new(color,at)
    # when :rook   then Rook.new(color,at)
    # when :bishop then Bishop.new(color,at)
    # when :queen  then Queen.new(color,at)
    # when :knight then Knight.new(color,at)
    # when :king   then King.new(color,at)
    # else nil
    end

  end

  def move(piece,to)
    if valid_move?(piece,to,piece.possible_moves)
      move_piece(piece,to)
      return true
    end
    false
  end

  def self.piece_icon(type,color)
    PIECES_IMAGES[color][type]
  end

  private

  def valid_move?(piece,to,moves)
    PIECE_MOVERS[piece.type].new.valid_move?(piece,to,moves,board)
  end

  def move_piece(piece,to)
    from = piece.position
    piece.position = to
    board.fill_square(to,piece)
    board.fill_square(from,nil)
  end

  def can_move_two_squares?(piece,to,destiny_empty)
    calc_distance(piece.position,to).abs > 1 && piece.moved == 0 && destiny_empty
  end

end
