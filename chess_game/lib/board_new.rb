require "colorize"
require "./lib/piece_new"
require "./lib/pawn_new"
require "./lib/rook_new"
require "./lib/bishop_new"
require "./lib/queen_new"
require "./lib/knight_new"
require "./lib/king"
require "./lib/move_pawn"
require "./lib/move_rook"
require "./lib/move_bishop"
require "./lib/move_knight"
require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/distance"

class Board_New

  EMPTY_STRING = ""
  SIZE = 8

  include Mapper
  include Coordenates
  include Distance

  attr_reader :squares, :rows, :columns, :en_passant_pieces

  def initialize
    @rows      = SIZE
    @columns   = SIZE
    @bg_colors = [:light_white, :cyan]
    @en_passant_pieces = []
    create_squares(rows,columns)
    load_pieces
  end

  def move_piece(piece,to)
    fill_square(to,piece)
    fill_square(piece.position,nil)
    piece.position = to
    piece.increment_moves
    control_en_passant_moves(piece) if piece.type == :pawn
  end

  def control_en_passant_moves(piece)
    if en_passant_pieces.empty?
      enable_en_passant_move(side_pieces(piece.position),piece)
    else
      disable_en_passant_move
    end
  end

  def enable_en_passant_move(opponents,piece)
    opponents.each do |opponent|
      if is_opponent?(piece,opponent) && opponent.type == :pawn
        @en_passant_pieces << opponent
        opponent.en_passant = true
      end
    end
  end

  def disable_en_passant_move
    en_passant_pieces.each {|piece| piece.en_passant = false}
    @en_passant_pieces = []
  end

  def is_opponent?(to_piece,piece)
    !piece.nil? && piece.color != to_piece.color
  end

  def side_pieces(to)
    filled_squares.select{|piece| squares_at_side_of(to).include?(piece.position)}
  end

  def draw_board
    draw_squares(@bg_colors[0])
    show_bottom_letters
  end

  def value_from(position)
    square = map_to_axis(position)
    squares[square[0]][square[1]]
  end

  def fill_square(position,value)
    at_xy = map_to_axis(position)
    squares[at_xy[0]][at_xy[1]] = value
  end

  def empty_square?(at)
    value_from(at).nil?
  end

  def filled_squares
    squares.map{|square| square.select{|value| value if !value.nil?}}.flatten
  end

  def clear_square(at)
    fill_square(at,nil)
  end

  private

  def draw_squares(bg_color)
    rows.times do |row|
      puts "".center(3) + draw_columns(bg_color)
      puts "#{rows-row}".center(3) + draw_columns(row,bg_color)
      puts "".center(3) + draw_columns(bg_color)
      bg_color = change_color(bg_color)
    end
  end

  def draw_columns(row=nil,bg_color)
    line = ""
    columns.times do |column|
      line += get_value_in(row,column).center(8).colorize(:color => :black, :background => bg_color)
      bg_color = change_color(bg_color)
    end
    line
  end

  def change_color(current_bg_color)
    [:light_white, :cyan].find {|color| color != current_bg_color}
  end

  def get_value_in(row,column)
    piece = get_square(row,column)
    (any_value_nil?([row,column]) || piece == nil) ? EMPTY_STRING : piece.image
  end

  def get_square(row,column)
    (row != nil && column != nil) ? squares[row][column] : nil
  end

  def any_value_nil?(values=[])
    values.any? {|value| value == nil}
  end

  def create_squares(row,columns)
    @squares = Array.new(rows) {Array.new(columns)}
  end

  def show_bottom_letters
    puts "".center(6)+(97.chr..(97+7).chr).to_a.join("".center(7))
  end

  def remove_nils_squares
    squares.map {|cells| cells.compact }.flatten
  end

  def load_pieces
    squares[0][0] = Piece_New.create_piece(:rook,:black,"a8")
    squares[0][1] = Piece_New.create_piece(:knight,:black,"b8")
    squares[0][2] = Piece_New.create_piece(:bishop,:black,"c8")
    squares[0][3] = Piece_New.create_piece(:queen,:black,"d8")
    squares[0][4] = Piece_New.create_piece(:king,:black,"e8")
    squares[0][5] = Piece_New.create_piece(:bishop,:black,"f8")
    squares[0][6] = Piece_New.create_piece(:knight,:black,"g8")
    squares[0][7] = Piece_New.create_piece(:rook,:black,"h8")

    squares[1][0] = Piece_New.create_piece(:pawn,:black,"a7")
    squares[1][1] = Piece_New.create_piece(:pawn,:black,"b7")
    squares[1][2] = Piece_New.create_piece(:pawn,:black,"c7")
    squares[1][3] = Piece_New.create_piece(:pawn,:black,"d7")
    squares[1][4] = Piece_New.create_piece(:pawn,:black,"e7")
    squares[1][5] = Piece_New.create_piece(:pawn,:black,"f7")
    squares[1][6] = Piece_New.create_piece(:pawn,:black,"g7")
    squares[1][7] = Piece_New.create_piece(:pawn,:black,"h7")

    squares[6][0] = Piece_New.create_piece(:pawn,:white,"a2")
    squares[6][1] = Piece_New.create_piece(:pawn,:white,"b2")
    squares[6][2] = Piece_New.create_piece(:pawn,:white,"c2")
    squares[6][3] = Piece_New.create_piece(:pawn,:white,"d2")
    squares[6][4] = Piece_New.create_piece(:pawn,:white,"e2")
    squares[6][5] = Piece_New.create_piece(:pawn,:white,"f2")
    squares[6][6] = Piece_New.create_piece(:pawn,:white,"g2")
    squares[6][7] = Piece_New.create_piece(:pawn,:white,"h2")

    squares[7][0] = Piece_New.create_piece(:rook,:white,"a1")
    squares[7][1] = Piece_New.create_piece(:knight,:white,"b1")
    squares[7][2] = Piece_New.create_piece(:bishop,:white,"c1")
    squares[7][3] = Piece_New.create_piece(:queen,:white,"d1")
    squares[7][4] = Piece_New.create_piece(:king,:white,"e1")
    squares[7][5] = Piece_New.create_piece(:bishop,:white,"f1")
    squares[7][6] = Piece_New.create_piece(:knight,:white,"g1")
    squares[7][7] = Piece_New.create_piece(:rook,:white,"h1")
  end

end

# system("clear")
# b = Board_New.new
# b.draw_board
#
# final = "n"
# moves = { pawn: MovePawn.new(b), rook: MoveRook.new(b), bishop: MoveBishop.new(b),
#           knight: MoveKnight.new(b)}
# while (final != "s")
#   print "Move piece from: "
#   from = gets.chomp
#   print "Move to: "
#   to = gets.chomp
#   piece = b.value_from(from)
#   moves[piece.type].move(piece,to)
#   # sleep(2)
#   system("clear")
#   b.draw_board
#   print "End the game? (s/n): "
#   final = gets.chomp
# end
