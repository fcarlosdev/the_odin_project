module Pieces

  RANK_LIMITS = ("1".."8")
  FILE_LIMITS = ("a".."h")

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

  def position_to_xy(position)
    files_to_xy = {
      "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4,
      "f" => 5, "g" => 6, "h" => 7
    }

    file = files_to_xy[position[1]]
    rank = position[2].to_i - 1

    xy_position = [rank,file]

  end
end
