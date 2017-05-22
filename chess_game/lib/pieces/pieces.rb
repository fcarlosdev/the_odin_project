require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'movements'


module Pieces

  TYPE_OF_PIECES = {
    pawn:   Pawn,   rook:   Rook,  knight: Knight,
    bishop: Bishop, queen:  Queen, king:   King
  }

  def create_piece(type,color,position="")
    TYPE_OF_PIECES[type].new(color,type,position)
  end

  def create_movements(board)
    Movements.new(board)
  end

  def possible_moves(piece,from=piece.current_position)
    piece.possible_moves(from)
  end

  def capture_moves(piece,from=piece.current_position)
    piece.capture_moves(from)
  end

  def valid_moves(piece,movements)
    possible_moves(piece).select {|m| movements.valid_move?(piece,piece.current_position,m)}
  end

  def valid_move?(piece,move,movements)
    movements.valid_move?(piece,piece.current_position,move)
  end

  def opponents_from(king,ammong_pieces)
    ammong_pieces.select {|piece| piece.color != king.color}
  end

end
