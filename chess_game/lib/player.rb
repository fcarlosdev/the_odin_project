class Player

  attr_reader :name, :color

  def initialize(name,color)
    @name = name
    @color = color
  end

  def make_move
    print "Enter your move (Ex.: a2,a3): "
    move = gets.chomp
  end

end
