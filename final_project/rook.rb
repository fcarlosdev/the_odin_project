require "./piece.rb"
require "./module/allowed_moves.rb"

class Rook < Piece
  include AllowedMoves

  def initialize(color, position)
    super(color,position)
  end

  def move_to(position)
    valid_move?(position) ? super(position) : @current_position
  end

  private

  def valid_move?(position)
    (position[0].eql?"R") && valid_xy_move?(@current_position,position)
  end

end
