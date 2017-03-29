require "./piece.rb"

class King < Piece

  attr_reader :possible_directions

  def initialize(color, type, image)
    @color = color
    @type = type
    @image = image
    @possible_directions = moves_directions
  end

  def possible_moves(from)
    generate_moves(from).map {|move| "K"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def moves_directions
    get_axes_from(cardinal_and_ordinal)
  end

  def generate_moves(from)
    map_to_positions(calculate_moves(from,possible_directions))
  end

end
