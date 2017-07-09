require "./lib/piece"
require "./lib/directions_new"

class Pawn < Piece

  def initialize(color,position)
    super(:pawn,color,position)
  end

  def possible_moves
    moves = generate_moves(position,default_directions,1).flatten.sort
    add_position_to(moves)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  private

  def generate_moves(from,directions,number_of_moves)
    directions.map{|d| valid_positions(from,d,number_of_moves)}
  end

  def default_directions
    Directions_New.norwesteast + Directions_New.soutwesteast
  end

  def add_position_to(positions)
    position = new_position
    return (position.length > 0) ? positions.push(position) : positions
  end

  def new_position
    (first_move?) ? position[0]+(position[1].to_i + displacement_by).to_s : ""
  end

  def displacement_by
    (color == :white) ? 2 : -2
  end

end
