require_relative "directions"
require_relative "coordenates"
require_relative "distance"

class Piece

  include Directions
  include Coordenates
  include Distance

  attr_reader :color, :type, :image, :coordinates, :moved_by, :first_move,
              :current_position, :number_of_moves

  def initialize(color, type, current_position="")
    @color            = color
    @type             = type
    @first_move       = true
    @image            = get_image
    @coordinates      = default_coordinates
    @current_position = current_position
    @number_of_moves  = 0
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

  def update_number_of_moves
    @number_of_moves += 1
  end

  def current_position=(new_position)
    @current_position = new_position
  end

  def capture_moves(from)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  private

  def generate_moves(from)
    generate_positions(from,coordinates)
  end

end
