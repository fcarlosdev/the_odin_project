require "./piece.rb"

class Queen < Piece

  WHITE_QUEEN_IMAGE = "\u2655"
  BLACK_QUEEN_IMAGE = "\u2658"

  attr_reader :current_pos

  def initialize(color)
    super(color,switch_image(color))
    @current_pos = {self => ""}
  end

  def current_pos=(position)
    @current_pos[self] = position
  end

  def move_to(new_position)
    super(new_position) ? new_position : current_pos
  end

  def switch_image(color)
    (color == :light_white) ? WHITE_QUEEN_IMAGE : BLACK_QUEEN_IMAGE
  end

end
