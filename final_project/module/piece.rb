module Piece

  LETTERS    = ("a".."h")
  LINES      = ("0".."7")

  attr_reader :color, :image, :current_pos

  def initialize(color, image, position=nil)
    @color = color
    @image = image
    @current_pos = position
  end

  def current_pos=(position)
    @current_pos = position
  end

  def move_to(new_position)
    (LETTERS.include?new_position[1]) && (LINES.include?new_position[2])
  end

end
