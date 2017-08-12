class Player

  attr_reader :name, :color

  def initialize(name,color)
    @name = name
    @color = color
  end

  def take_turn
    mount_message("from")
    from = gets.chomp
    mount_message("to")
    to = gets.chomp
    [from,to]
  end

  private

  def mount_message(with_preposition)
    print "Move piece " + with_preposition
  end

end
