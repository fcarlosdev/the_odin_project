module Pieces

  ICONS = {
   :white_king  => "\u2654", :white_queen => "\u2655", :white_rook => "\u2656",
   :white_bishop => "\u2657", :white_knight => "\u2658", :white_pawn => "\u2659",
   :black_king  => "\u265A", :black_queen => "\u265B", :black_rook => "\u265C",
   :black_bishop => "\u265D", :black_knight => "\u265E", :black_pawn => "\u265F"
  }

  def get_icon_of(piece)
    color = (piece.color.to_s.include?"white") ? "white_" : "black_"
    ICONS[color.concat(piece.class.to_s.downcase).to_sym]
  end


end
