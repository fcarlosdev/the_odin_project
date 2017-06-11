require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/directions"
require_relative "modules/distance"

class Piece_New

  include Mapper
  include Coordenates
  include Directions
  include Distance

  PIECES_IMAGES = { white: { king:   "\u2654", queen:  "\u2655", rook: "\u2656",
                             bishop: "\u2657", knight: "\u2658", pawn: "\u2659" },
                    black: { king:   "\u265a", queen:  "\u265b", rook: "\u265c",
                             bishop: "\u265d", knight: "\u265e", pawn: "\u265f" }
                   }


  attr_reader :color, :type, :position, :image, :moves, :movements

  def initialize(type,color,position,movements={})
    @color    = color
    @type     = type
    @position = position
    @image    = piece_icon(type,color)
    @moves    = 0
    @movements = movements
  end

  def self.create_piece(type,color,at)
    case type
    when :pawn   then Pawn_New.new(color,at)
    when :rook   then Rook.new(color,at)
    when :bishop then Bishop.new(color,at)
    when :queen  then Queen.new(color,at)
    when :knight then Knight.new(color,at)
    when :king   then King.new(color,at)
    else nil
    end
  end

  def move(to,chess_board)
    move(to,chess_board)
  end

  def capture_moves
    capture_moves
  end

  def move(to,chess_board)
    move(to,chess_board)
  end

  def position=(new_position)
    @position = new_position
  end

  def increment_moves
    @moves += 1
  end

  def first_move?
    moves == 0
  end

  private

  def piece_icon(type,color)
    PIECES_IMAGES[color][type]
  end


end
