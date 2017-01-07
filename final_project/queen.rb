require "./module/piece.rb"
require "./module/allowed_moves.rb"

class Queen

  include Piece
  include AllowedMoves

  def initialize(color,position)
    super(color,position)
  end

  def move_to(position)
    @current_pos = (super(position) && valid_move?(position)) ? position : @current_pos
  end

  private

  def valid_move?(position)
    position[0]=="Q" && (valid_xy_move?(@current_pos,position) ||
                         valid_diagonal_move?(@current_pos,position))
  end

end
