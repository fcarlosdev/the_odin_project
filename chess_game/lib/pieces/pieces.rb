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

  def valid_moves_of(piece,movements)
    possible_moves(piece).select {|m| movements.valid_move?(piece,piece.current_position,m)}
  end

  def king_in_checkmate?(pieces,king_piece,movements)
    valid_moves = valid_moves_of(king_piece,movements)
    pieces.each do |piece|
      return (piece.color != king_piece.color) ? !king_has_escape_move?(king_piece,piece,valid_moves) : false
    end
  end

  def king_has_escape_move?(king_piece,piece,valid_moves_of_king)
    capture_moves(piece).any? {|m| valid_moves_of_king.all?{|v| v[1..2] == m[1..2]}}
  end


end
