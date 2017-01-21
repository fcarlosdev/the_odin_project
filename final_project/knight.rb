require "./piece.rb"

class Knight < Piece

  AXIS = [[-1, 2], [1, 2], [-2, 1], [2, 1], [-2, -1], [2, -1], [-1, -2], [1, -2]]

  def initialize(color,position)
    super(color,position)
  end

  def move_to(position)
    @current_position = valid_move?(position)? super(position) : @current_position
  end

  def valid_move?(position)
    super(position) && position[0] == "N" && valid_axis_move?(position)
  end

  private

  def valid_axis_move?(position)
    AXIS.any? {|xy| xy.include?([calculate_xy(position)])}
  end

  def calculate_xy(position)
    (1..2).collect {|xy| position[xy].ord - @current_position[xy].ord}
  end

end
