require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/distance"
require "./lib/directions_new"

class Piece

  include Mapper
  include Coordenates
  include Distance

  PIECES_IMAGES = { white: { king:   "\u2654", queen:  "\u2655", rook: "\u2656",
                             bishop: "\u2657", knight: "\u2658", pawn: "\u2659" },
                    black: { king:   "\u265a", queen:  "\u265b", rook: "\u265c",
                             bishop: "\u265d", knight: "\u265e", pawn: "\u265f" }
                   }


  attr_reader :color, :type, :position, :image, :moves

  def initialize(type,color,position)
    @color    = color
    @type     = type
    @position = position
    @image    = piece_icon(type,color)
    @moves    = 0
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
  end

  def increment_moves
    @moves += 1
  end

  def first_move?
    moves == 1
  end

  private

  def piece_icon(type,color)
    PIECES_IMAGES[color][type]
  end

  def possible_positions(from,directions,move_by)
    to_positions(generate_directions(from,directions,move_by))
  end

  def generate_directions(from,directions,move_by)
    directions.map{|d| new_coordinate(from,move_by,d)}
  end

  def new_coordinate(from,move_by,direction)
    Directions_New.generate_coordinates(from,move_by,direction)
  end

  def to_positions(coordinates)
    coordinates.map{|r| map_to_positions(r)}.flatten.uniq.sort
  end

  def to_xy(position)
    map_to_axis(position)
  end

end
