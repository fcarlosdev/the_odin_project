class Player

  attr_reader :name, :piece_type

  def initialize(name,piece_type)
    @name       = name
    @piece_type = piece_type
  end

  def move_piece_from
    print "Move the piece from: "
    gets.chomp.downcase.capitalize
  end

  def move_piece_to
    print "Move the piece to:"
    gets.chomp.downcase.capitalize
  end

end
