require "./lib/piece.rb"
require "./lib/pawn"
require "./lib/rook"
require "./lib/bishop"
require "./lib/queen"
require "./lib/knight"
require "./lib/king"

module Pieces

  def self.create_pieces
    pieces = []

    pieces << Piece.create_piece(:rook,:black,"a8")
    pieces << Piece.create_piece(:knight,:black,"b8")
    pieces << Piece.create_piece(:bishop,:black,"c8")
    pieces << Piece.create_piece(:queen,:black,"d8")
    pieces << Piece.create_piece(:king,:black,"e8")
    pieces << Piece.create_piece(:bishop,:black,"f8")
    pieces << Piece.create_piece(:knight,:black,"g8")
    pieces << Piece.create_piece(:rook,:black,"h8")

    pieces << Piece.create_piece(:pawn,:black,"a7")
    pieces << Piece.create_piece(:pawn,:black,"b7")
    pieces << Piece.create_piece(:pawn,:black,"c7")
    pieces << Piece.create_piece(:pawn,:black,"d7")
    pieces << Piece.create_piece(:pawn,:black,"e7")
    pieces << Piece.create_piece(:pawn,:black,"f7")
    pieces << Piece.create_piece(:pawn,:black,"g7")
    pieces << Piece.create_piece(:pawn,:black,"h7")

    pieces << Piece.create_piece(:pawn,:white,"a2")
    pieces << Piece.create_piece(:pawn,:white,"b2")
    pieces << Piece.create_piece(:pawn,:white,"c2")
    pieces << Piece.create_piece(:pawn,:white,"d2")
    pieces << Piece.create_piece(:pawn,:white,"e2")
    pieces << Piece.create_piece(:pawn,:white,"f2")
    pieces << Piece.create_piece(:pawn,:white,"g2")
    pieces << Piece.create_piece(:pawn,:white,"h2")

    pieces << Piece.create_piece(:rook,:white,"a1")
    pieces << Piece.create_piece(:knight,:white,"b1")
    pieces << Piece.create_piece(:bishop,:white,"c1")
    pieces << Piece.create_piece(:queen,:white,"d1")
    pieces << Piece.create_piece(:king,:white,"e1")
    pieces << Piece.create_piece(:bishop,:white,"f1")
    pieces << Piece.create_piece(:knight,:white,"g1")
    pieces << Piece.create_piece(:rook,:white,"h1")
    pieces
  end

  def self.select_enemies_of(from_piece,pieces)
    pieces.select{|piece| piece.color != from_piece.color}
  end

end
