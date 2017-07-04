require "./lib/piece"

class Bishop < Piece

  def initialize(color,position)
    super(:bishop,color,position)
  end

  def possible_moves
    Directions_New.intercardinal.map{|direction| valid_positions(position,direction,7)}
  end

  def possible_move?(to)
    possible_moves.any?{|move| move.include?(to)}
  end

end
