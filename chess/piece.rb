require "./modules/directions.rb"
require "./modules/coordenates.rb"
require "./modules/distance.rb"

class Piece

  include Directions
  include Coordenates
  include Distance

  attr_reader :color, :type, :image, :coordinates, :moved_by
  attr_accessor :number_of_moves

  def initialize(color, type)
    @color = color
    @type = type
    @image = get_image
    @coordinates = default_coordinates
    @number_of_moves = 0
    @moved_by = 0
    post_initialize
  end

  def capture_move?(from,to)
    false
  end

  def post_initialize
    nil
  end

  def first_move?
    number_of_moves == 0
  end

  private

  def generate_moves(from)
    map_to_positions(calculate_moves(from,coordinates))
  end

  def update_first_move
    @number_of_moves += 1
  end

end
