require "./module/pieces.rb"

class Piece

  include Pieces

  attr_reader :color, :icon, :current_position, :start_position, :first_move

  def initialize(color, position)
    @color            = color
    @icon             = get_icon_of(self)
    @start_position   = position
    @current_position = position
    @first_move       = true
  end

  def move_to(new_position)
    if (valid_move?(new_position))
      @first_move = false
      @current_position = new_position
    end
  end

  def valid_move?(new_position)
    (FILE_LIMITS.include?new_position[1]) && (RANK_LIMITS.include?(new_position[2..new_position.length]))
  end

  def first_move=(value)
    @first_move = value
  end

end
