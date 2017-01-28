require "./directions.rb"

module PiecesUtil

  include Directions

  RANK_LIMITS = ("1".."8")
  FILE_LIMITS = ("a".."h")

  ICONS = {
   white_king:   "\u2654", white_queen:  "\u2655", white_rook: "\u2656",
   white_bishop: "\u2657", white_knight: "\u2658", white_pawn: "\u2659",
   black_king:   "\u265A", black_queen:  "\u265B", black_rook: "\u265C",
   black_bishop: "\u265D", black_knight: "\u265E", black_pawn: "\u265F"
  }

  def self.move_one_square(position,directions)
    xy = position_to_axis(position)
    Directions.xy_from_cardinals(directions).collect {|d| [xy[0]+d[0], xy[1]+d[1]]}
  end

  def self.move_till_limits(position,directions)
    xy    = position_to_axis(position)
    moves = []
    Directions.xy_from_cardinals(directions).each do |d|
      while on_limits?(xy) do
        moves << xy
        xy = [xy[0]+d[0], xy[1]+d[1]]
      end
      xy = position_to_axis(position)
    end
    moves
  end

  def self.on_limits?(position)
    (0..1).all? {|i| (0..7).include?(position[i])}
  end

  def self.get_icon_of(piece)
    color = (piece.color.to_s.include?"white") ? "white_" : "black_"
    ICONS[color.concat(get_piece_name(piece).downcase).to_sym]
  end

  def self.xy_to_rank_files(axis)
    (axis.class == Array) ? axis.map {|xy| axis_to_position(xy)} : nil
  end

  def self.position_to_axis(position)
    file_to_col = { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }
    file = file_to_col[position[1].to_sym]
    rank = (position[2].to_i - 1)
    [rank,file]
  end

  def self.axis_to_position(xy)
    files = { 0 => "a", 1 => "b", 2 => "c", 3 => "d", 4 => "e",
              5 => "f", 6 => "g", 7 => "h" }
    files[ xy[1] ] + (xy[0]+1).to_s
  end

  private

  def self.get_piece_name(piece)
    piece_name = piece.class.to_s
    piece_name[(piece_name.index("::")+2)..piece_name.length]
  end


  private_class_method :get_piece_name

end
