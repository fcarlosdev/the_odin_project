require "./piece.rb"

class King < Piece

  def initialize(color,position)
    super(color, position)
  end

  def move_to(new_position)
    @current_position = (valid_move?(new_position)) ? super(new_position) : @current_position
  end

  def valid_move?(position)
    super(position) && (moved_by_one?(position) || castling_move?(position))
  end

  private

  def moved_by_one?(position)
    2.times.all? {|ind| (-1..1).include?(position[ind+1].ord - @current_position[ind+1].ord)}
  end

  def castling_move?(positon)
    (@first_move && ((positon[1].ord - @current_position[1].ord) == 2))
  end
end
