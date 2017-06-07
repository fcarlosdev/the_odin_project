class Player

  attr_reader :name, :color

  def initialize(name,color)
    @name = name
    @color = color
    @on_check = false
  end

end
