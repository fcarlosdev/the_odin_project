require "./rook.rb"
require "./knight.rb"
require "./bishop.rb"
require "./queen.rb"
require "./king.rb"
require "./pawn.rb"
require "./modules/mapper.rb"
require "./modules/directions.rb"


module Pieces

  include Mapper

  LIST_OF_PIECES = {
    white_pawn: Pawn.new("white",:pawn),
    white_rook: Rook.new("white",:rook),
    white_knight: Knight.new("white",:knight),
    white_bishop: Bishop.new("white",:bishop),
    white_queen: Queen.new("white",:queen),
    white_king: King.new("white",:king),
    black_pawn: Pawn.new("black",:pawn),
    black_rook: Rook.new("black",:rook),
    black_knight: Knight.new("black",:knight),
    black_bishop: Bishop.new("black",:bishop),
    black_queen: Queen.new("black",:queen),
    black_king: King.new("black",:king)
  }

  def create_piece(type)
    LIST_OF_PIECES[type]
  end

  def get_pieces
    LIST_OF_PIECES.values
  end

  def get_white_pieces
    LIST_OF_PIECES.values.select {|v| v.type == "white"}
  end

end
