require "./piece.rb"

class Pawn < Piece

  DIFF_BY_RANK = 0
  DIFF_BY_FILE = 1

  def initialize(color,initial_position)
    super(color,initial_position)
  end

  def move_to(new_position)
    return (valid_move?(new_position)) ? super(new_position) : @current_position
  end

  def valid_move?(new_position)
    valid = super(new_position)
    if (new_position[1] == @start_position[1])
      valid &= valid_rank_move?(new_position)
    else
      valid &= valid_capture_move?(new_position)
    end
  end

  private

  def valid_rank_move?(new_position)
    moved_by(new_position) ? (2 && @first_move) : 1
  end

  def valid_capture_move?(new_position)
    (-1..1).cover?(diff(@current_position,new_position,DIFF_BY_FILE))
  end

  def moved_by(new_position)
    diff(new_position,get_ref_positon,DIFF_BY_RANK)
  end

  def diff(from,to,xy)
    position_to_xy(from)[xy] - position_to_xy(to)[xy]
  end

  def get_ref_positon
    (@current_position != @start_position) ? @start_position : @current_position
  end

end
