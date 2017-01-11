require "./module/piece.rb"

class Pawn

  include Piece

  CAPTURE_XY = [[1,-1], [-1,-1], [1,1], [-1,1]]
  attr_reader :initial_position

  def initialize(color, position)
    super(color,position)
    @initial_position = position
  end

  def move_to(position)
    @current_pos = (super(position) && valid_move?(position)) ? position : @current_pos
  end

  def promote_to_other_piece?(position)
    (position[2].to_i  == 8 && @initial_position[2].to_i == 2)
  end

  def capture(piece)
    return false if (piece == nil)
    pos = piece.current_pos
    CAPTURE_XY.any? do |v|
      (pos[1].ord + v[0]).chr + (pos[2].to_i + v[1]).to_s == @current_pos[1,2] &&
        self.color != piece.color
    end
  end

  private

  def valid_move?(position)
    position[0] == "P" && allowed_pawn_move?(position)
  end

  def allowed_pawn_move?(position)
    [2,7].include?(@current_pos[2].to_i) ? move_ok?(position,2) : move_ok?(position,1)
  end

  def move_ok?(position, move_by)
    (position[2].to_i - @current_pos[2].to_i) <= move_by
  end


end
