class Player

  attr_reader :name, :color_of_piece

  def initialize(name,color_of_piece)
    @name = name
    @color_of_piece = color_of_piece
  end

  def his_piece?(color)
    color == color_of_piece
  end

end
