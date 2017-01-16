require "./piece.rb"

class Knight < Piece

  AXIS = [[-1, 2], [1, 2], [-2, 1], [2, 1],
           [-2, -1], [2, -1], [-1, -2], [1, -2]]

  def initialize(color,position)
    super(color,position)
  end

  def move_to(position)
    @current_pos = (super(position) && valid_knight_move?(position))? position : @current_pos
  end

  private

  def valid_knight_move?(position)
    position[0] == "N" && valid_axis_move?(position)
  end

  def valid_axis_move?(position)
    AXIS.any? do |r|
      file = (@current_pos[1].ord + r[0]).chr
      rank = (@current_pos[1].to_i + r[1]).to_s
      (rank+file).include?(position)
    end
  end

end
