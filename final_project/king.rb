require "./piece.rb"

class King < Piece

  WHITE_KING_IMAGE = "\u2654"
  BLACK_KING_IMAGE = "\u265A"

  attr_reader :current_pos

  def initialize(color)
    @current_pos = {self => ""}
    super(color, switch_image(color))
  end

  def current_pos=(position)
    @current_pos[self] = position
  end

  def move_to(new_position)
    @current_pos[self] = (super(new_position) && valid_move?(new_position)) ? new_position : @current_pos[self]
  end

  private

  def valid_move?(position)
    (position[0].eql?"K") && moved_by_one_square?(position)
  end

  def moved_by_one_square?(position)
    2.times.all? {|ind| ((position[ind+1].ord - @current_pos[self][ind+1].ord) <= 1)}
  end

  def switch_image(color)
    (color == :light_white) ? WHITE_KING_IMAGE : BLACK_KING_IMAGE
  end

end
