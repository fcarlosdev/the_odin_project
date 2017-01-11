require "./module/pieces.rb"

module Piece

  include Pieces

  LETTERS    = ("a".."h")
  LINES      = ("1".."8")

  attr_reader :color, :image, :current_pos

  def initialize(color, position=nil)
    @color = color
    @image = get_icon_of(self)
    @current_pos = position
  end

  def current_pos=(position)
    @current_pos = position
  end

  def move_to(new_position)
    (LETTERS.include?new_position[1]) && (LINES.include?new_position[2])
  end

  def capture(the_piece,by_the_piece)
    self.capture(the_piece)
  end

end
