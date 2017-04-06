require "./modules/directions.rb"
require "./modules/movements.rb"

class Piece

  include Directions
  include Movements

  attr_reader :color, :type, :image, :coordinates, :first_move

  def initialize(color, type, image)
    @color = color
    @type = type
    @image = image
    @coordinates = get_coordinates
    @first_move = true
  end

  private

  def get_coordinates
    []
  end

  def generate_moves(from)
    map_to_positions(calculate_moves(from,coordinates))
  end

  def update_first_move
    @first_move = false
  end

  def first_move?
    (first_move == true)
  end

  # def update_coordinates(new_coordinates)
  #   coordinates = new_coordinates
  # end

end
