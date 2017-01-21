require "./module/diagonal_move.rb"
require "./module/file_moves.rb"

module AllowedMoves

  include DiagonalMove
  include FileMoves

  def valid_diagonal_move?(current_position,new_position)
    moved_only_along_diagonal?(current_position,new_position)
  end

  def valid_xy_move?(current_position,new_position)
    FileMoves.get_xy_moves(current_position).include?(new_position)
  end

end
