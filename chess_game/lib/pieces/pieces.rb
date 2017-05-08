require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'

module Pieces

  TYPE_OF_PIECES = {
    pawn:   Pawn,   rook:   Rook,  knight: Knight,
    bishop: Bishop, queen:  Queen, king:   King
  }

  def create_piece(type,color,position="")
    TYPE_OF_PIECES[type].new(color,type,position)
  end

end
