require "./piece.rb"
require "./module/allowed_moves.rb"

class Queen < Piece

  include AllowedMoves

  def initialize(color,position)
    super(color,position)
  end

  def move_to(position)
    valid_move?(position) ? super(position) : @current_position
  end

  def valid_move?(position)
    super(position) && position.start_with?("Q") &&
      (valid_xy_move?(@current_position,position) || move_trough_diagonal?(position))
  end

  private

  def move_through_xy?(position)
    valid_xy_move?(@current_position,position)
  end

  def move_trough_diagonal?(position)
    valid_diagonal_move?(@current_position,position)
  end

end
