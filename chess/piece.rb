require "./modules/directions.rb"
require "./modules/calculate_moves.rb"
require "./modules/calculate_distance.rb"

class Piece

  include Directions
  include CalculateMoves
  include CalculateDistance

  attr_reader :color, :image, :type, :position, :first_move

  def initialize(args={})
    @color    = args[:color]
    @position = args[:position]
    @first_move = true
    post_initialize
  end

  def move(from,to)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def possible_moves(from)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  protected

  def valid_move?(from,to)
    [from,to].all? {|location| ("a".."h").include?(location[1]) && (1..8).include?(location[2].to_i) }
  end

  def post_initialize
    nil
  end

end
