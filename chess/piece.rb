require "./modules/directions.rb"
require "./modules/moves_calculator.rb"

class Piece

  include Directions
  include MovesCalculator

  attr_reader :color, :type, :image, :possible_directions

  def initialize(color, type, image)
    @color = color
    @type = type
    @image = image
    @possible_directions = get_axis_directions
  end

  private

  def get_axis_directions
    []
  end

  def generate_moves(from)
    map_to_positions(calculate_moves(from,possible_directions))
  end


end
