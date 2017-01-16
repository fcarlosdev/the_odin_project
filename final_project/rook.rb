require "./piece.rb"
require "./module/allowed_moves.rb"

class Rook < Piece
  include AllowedMoves

  def initialize(color, position)
    super(color,position)
  end

  def move_to(position)
    @current_pos = (super(position) && valid_move?(position)) ? position : @current_pos
  end

  private

  def valid_move?(position)
    (position[0].eql?"R") && valid_xy_move?(@current_pos,position)
  end

end
