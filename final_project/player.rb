class Player

  attr_reader :name, :color

  def initialize(name,color)
    @name  = name
    @color = color
  end

  def move_one_piece
    gets.chomp.downcase.capitalize
  end

end
