require "./module/diagonal_move.rb"

module AllowedMoves

  include DiagonalMove

  def valid_diagonal_move?(current_position,new_position)
    moved_only_along_diagonal?(current_position,new_position)
  end

  def valid_xy_move?(current_position,new_position)
    2.times.any? {|ind| new_position[ind+1] == current_position[ind+1]}
  end

end
