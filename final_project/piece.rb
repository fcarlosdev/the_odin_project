class Piece

  LETTERS    = ("a".."h")
  LINES      = ("0".."7")

  attr_reader :color, :image

  def initialize(color, image)
    @color = color
    @icon  = image
  end

  def valid_move?(letter,line)
    (LETTERS.include?letter) && (LINES.include?line)    
  end

end
