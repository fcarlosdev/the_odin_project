class Piece

  PIECES_IMAGES = { white: { king:   "\u2654", queen:  "\u2655", rook: "\u2656",
                             bishop: "\u2657", knight: "\u2658", pawn: "\u2659" },
                    black: { king:   "\u265a", queen:  "\u265b", rook: "\u265c",
                             bishop: "\u265d", knight: "\u265e", pawn: "\u265f" }
                   }


  attr_reader :color, :type, :position, :image, :moves, :old_position

  def initialize(type,color,position)
    @color        = color
    @type         = type
    @position     = position
    @old_position = position
    @image        = piece_icon(type,color)
    @moves        = 0
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
    @old_position = @position
    @position = new_position
  end

  def increment_moves
    @moves += 1
  end

  def first_move?
    moves == 0
  end

  def moved_by(from,to)
    calc_distance(from,to).abs
  end

  def moves=(number)
    @moves = number
  end

  private

  def piece_icon(type,color)
    PIECES_IMAGES[color][type]
  end

  def valid_positions(position,direction,max_displacement)
    displacements = [to_xy(position)]
    max_displacement.times do
      move = [direction[0]+displacements.last[0],direction[1]+displacements.last[1]]
      displacements << move if (on_range?(move))
    end
    displacements.map{|d| map_to_position(d) if d != displacements.first}.compact
  end

  def to_xy(position)
    map_to_axis(position)
  end

end
