require "./modules/directions.rb"
require "./modules/coordenates.rb"
require "./modules/distance.rb"

class Piece

  include Directions
  include Coordenates
  include Distance

  attr_reader :color, :type, :image, :coordinates, :first_move

  def initialize(color, type)
    @color = color
    @type = type
    @image = get_image
    @coordinates = default_coordinates
    @first_move = true
  end

  def capture_move?(from,to)
    false
  end

  private

  def generate_moves(from)
    map_to_positions(calculate_moves(from,coordinates))
  end

  def update_first_move
    @first_move = false
  end

  def first_move?
    (first_move == true)
  end

end
