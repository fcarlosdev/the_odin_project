require "./modules/directions.rb"
require "./modules/calculate_moves.rb"

class Piece

  include Directions
  include CalculateMoves

  attr_reader :color, :type, :image

  def initialize
    raise RuntimeError, "You are trying to instantiate an abstract class!"
  end

end
