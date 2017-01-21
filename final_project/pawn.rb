require "./piece.rb"

class Pawn < Piece

  DIFF_BY_RANK = 0
  DIFF_BY_FILE = 1

  def initialize(color,initial_position)
    super(color,initial_position)
  end

  def move_to(new_position)
    (valid_move?(new_position)) ? super(new_position) : @current_position
  end

  def valid_move?(position)
    super(position) && distance_valid?(position)
  end

  private

  def distance_valid?(position)
    distance = get_distance(position)
    rank_move = is_rank_move?(position)
    (distance == 2 && rank_move && is_first_move?) || distance == 1
  end

  def is_rank_move?(position)
    (position[1].ord - @current_position[1].ord == 0)
  end

  def is_first_move?
    ["7","2"].include?(@current_position[2])
  end

  def get_distance(position)
    (position[2].to_i - @current_position[2].to_i).abs
  end


end
