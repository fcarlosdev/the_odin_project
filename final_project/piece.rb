class Piece

  LETTERS    = ("a".."h")
  LINES      = ("0".."7")

  attr_reader :color, :image

  def initialize(color, image)
    @color = color
    @image = image
  end

  def move_to(new_position)
    (LETTERS.include?new_position[1]) && (LINES.include?new_position[2])
  end

end
