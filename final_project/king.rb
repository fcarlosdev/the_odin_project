require "./piece.rb"

class King < Piece

  def initialize(color,position)
    super(color, position)
  end

  def move_to(new_position)
    @current_pos = (super(new_position) && valid_move?(new_position)) ? new_position : @current_pos
  end

  private

  def valid_move?(position)
    (position[0].eql?"K") && (castling_move?(position) || moved_by_one_square?(position))
  end

  def moved_by_one_square?(position)
    2.times.all? {|ind| (-1..1).include?(position[ind+1].ord - @current_pos[ind+1].ord)}
  end

  def castling_move?(position)
    (@current_pos == "Ke1") && (position[1].ord - @current_pos[1].ord) == 2 &&
      (position[2].to_i - @current_pos[2].to_i == 0)
  end

end
