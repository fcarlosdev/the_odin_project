require_relative "directions"
require_relative "coordenates"
require_relative "distance"

class Piece

  include Directions
  include Coordenates
  include Distance

  attr_reader :color, :type, :image, :coordinates, :moved_by, :first_move

  def initialize(color, type)
    @color = color
    @type = type
    @image = get_image
    @coordinates = default_coordinates
    @moved_by = 0
    @first_move = true
    post_initialize
  end

  def capture_move?(from,to)
    false
  end

  def post_initialize
    nil
  end

  def first_move=(status)
    @first_move = status
  end

  private

  def generate_moves(from)
    map_to_positions(calculate_moves(from,coordinates))
  end

end
