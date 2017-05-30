require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/directions"
require_relative "modules/distance"

class Piece

  include Mapper
  include Coordenates
  include Directions
  include Distance

  attr_reader :color, :type, :position, :image, :moved

  def initialize(type,color,position)
    @color    = color
    @type     = type
    @position = position
    @moved    = 0
  end

  def possible_moves
    raise NotImplementedError, "This #{self.class} cannot respond to: possible_moves"
  end

  def valid_move?(to,value_at_destiny)
    raise NotImplementedError, "This #{self.class} cannot respond to: valid_move?"
  end

  def position=(new_position)
    @position = new_position
    @moved += 1
  end

  private

end
