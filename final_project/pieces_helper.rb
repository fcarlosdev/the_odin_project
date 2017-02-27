require "./directions.rb"

module PiecesHelper

  include Directions

  RANK_LIMITS = ("1".."8")
  FILE_LIMITS = ("a".."h")

  ICONS = {
   white_king:   "\u2654", white_queen:  "\u2655", white_rook: "\u2656",
   white_bishop: "\u2657", white_knight: "\u2658", white_pawn: "\u2659",
   black_king:   "\u265A", black_queen:  "\u265B", black_rook: "\u265C",
   black_bishop: "\u265D", black_knight: "\u265E", black_pawn: "\u265F"
  }

  def self.move_till_two_squares(position,directions, by_two = 1)
    xy = position_to_axis(position)
    extract_factors(directions).map {|f| [(xy[0]+(f[0]*by_two)), xy[1]+f[1]] }
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
    idx = (position.length == 3) ? [1,2] : [0,1]
    [to_line(position[idx[1]].to_i),to_column(position[idx[0]].ord)]
  end

  def self.axis_to_position(xy)
    ('a'.ord + xy[1]).chr + (8 - xy[0]).to_s
  end

  private

  def self.get_piece_name(piece)
    piece_name = piece.class.to_s
    piece_name[(piece_name.index("::")+2)..piece_name.length]
  end

  def self.to_line(rank)
    (rank <= 0) ? 7 : (8 - rank)
  end

  def self.to_column(file)
    (file - 'a'.ord)
  end

  def self.extract_factors(directions)
    Directions.xy_from_cardinals(directions)
  end

  private_class_method :get_piece_name
  private_class_method :to_line
  private_class_method :to_column
  private_class_method :extract_factors

end
