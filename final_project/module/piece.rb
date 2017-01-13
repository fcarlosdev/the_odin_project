require "./module/pieces.rb"

module Piece

  include Pieces

  LETTERS    = ("a".."h")
  LINES      = ("1".."8")

  attr_reader :color, :image, :current_pos, :initial_position, :first_move

  def initialize(color, position=nil)
    @color            = color
    @image            = get_icon_of(self)
    @initial_position = position
    @current_pos      = @initial_position
    @first_move       = true
  end

  def current_pos=(position)
    @current_pos = position
  end

  def first_move=(value)
    @first_move = value
  end

  def move_to(new_position)
    (LETTERS.include?new_position[1]) && (LINES.include?new_position[2])
  end

  def capture(the_piece,by_the_piece)
    self.capture(the_piece)
  end

  def update_first_move
    if (@current_pos != @initial_position)
      @first_move = false
    end
  end

end
