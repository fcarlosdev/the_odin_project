require "./piece.rb"

class King < Piece

  KING_IMAGE = "\u2654"

  def initialize(color)
    super(color, KING_IMAGE)
  end

  def valid_move?(position)
    (position[0].eql?"K") && super().valid_move?(position[1],position[2])
  end

end
