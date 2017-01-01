require "./module/piece.rb"

class King

  include Piece

  WHITE_KING_IMAGE = "\u2654"
  BLACK_KING_IMAGE = "\u265A"

  def initialize(color,position)
    super(color, position)
  end

  def move_to(new_position)
    @current_pos = (super(new_position) && valid_move?(new_position)) ? new_position : @current_pos
  end

  private

  def valid_move?(position)
    (position[0].eql?"K") && moved_by_one_square?(position)
  end

  def moved_by_one_square?(position)
    2.times.all? {|ind| (-1..1).include?(position[ind+1].ord - @current_pos[ind+1].ord)}
  end

  def switch_image(color)
    (color == :light_white) ? WHITE_KING_IMAGE : BLACK_KING_IMAGE
  end

end

# k = King.new(:light_white,"Rd5")
# puts k.image
