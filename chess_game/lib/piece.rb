require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/directions"
require_relative "modules/distance"

class Piece

  include Mapper
  include Coordenates
  include Directions
  include Distance

  PIECES_IMAGES = { white: { king:   "\u2654", queen:  "\u2655", rook: "\u2656",
                             bishop: "\u2657", knight: "\u2658", pawn: "\u2659" },
                    black: { king:   "\u265a", queen:  "\u265b", rook: "\u265c",
                             bishop: "\u265d", knight: "\u265e", pawn: "\u265f" }
                   }


  attr_reader :color, :type, :position, :image, :moved

  def initialize(type,color,position)
    @color    = color
    @type     = type
    @position = position
    @image     = piece_icon(type,color)
    @moved    = 0
  end

  def self.create_piece(type,color,at)
    case type
    when :pawn   then Pawn.new(color,at)
    when :rook   then Rook.new(color,at)
    when :bishop then Bishop.new(color,at)
    when :queen  then Queen.new(color,at)
    when :knight then Knight.new(color,at)
    when :king   then King.new(color,at)
    else nil
    end
  end

  def position=(new_position)
    @position = new_position
    @moved += 1
  end


  private

  def piece_icon(type,color)
    PIECES_IMAGES[color][type]
  end


end
