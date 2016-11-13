class Player

  attr_reader :name, :type

  def initialize(type,name="Player")
    @type = type
    @name = name
  end

  def make_a_play
    print "Make a move Player #{self.name}: "
    gets.chomp.upcase.to_sym
  end

end
