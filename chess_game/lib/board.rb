require "colorize"
require "./lib/pawn"
require_relative "modules/mapper"
require "./lib/pieces"

class Board

  EMPTY_STRING = ""
  SIZE = 8

  include Mapper

  attr_reader :squares, :rows, :columns

  def initialize
    @rows = SIZE
    @columns = SIZE
    @bg_colors  = [:light_white, :cyan]
    create_squares(rows,columns)
    load_pieces
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

  # def position_from(piece_type, from_color)
  #   piece_found = remove_nils_squares.select {|piece| piece.type == piece_type && piece.color == from_color}
  #   piece_found[0].current_position if piece_found.length > 0
  # end

  # def board_pieces
  #   squares.each_with_object([]) do |rows, values|
  #     rows.each do |piece|
  #       values << piece if piece != nil
  #     end
  #   end
  # end

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
    # squares[0][0] = create_piece(:rook,   :black, "Ra8")
    # squares[0][1] = create_piece(:knight, :black, "Nb8")
    # squares[0][2] = create_piece(:bishop, :black, "Bc8")
    # squares[0][3] = create_piece(:queen,  :black, "Qd8")
    # squares[0][4] = create_piece(:king,   :black, "Ke8")
    # squares[0][5] = create_piece(:bishop, :black, "Bf8")
    # squares[0][6] = create_piece(:knight, :black, "Ng8")
    # squares[0][7] = create_piece(:rook,   :black, "Rh8")

    squares[1][0] = Pieces.create_piece(:pawn,:black,"a7")
    squares[1][1] = Pieces.create_piece(:pawn,:black,"b7")
    squares[1][2] = Pieces.create_piece(:pawn,:black,"c7")
    squares[1][3] = Pieces.create_piece(:pawn,:black,"d7")
    squares[1][4] = Pieces.create_piece(:pawn,:black,"e7")
    squares[1][5] = Pieces.create_piece(:pawn,:black,"f7")
    squares[1][6] = Pieces.create_piece(:pawn,:black,"g7")
    squares[1][7] = Pieces.create_piece(:pawn,:black,"h7")

    squares[6][0] = Pieces.create_piece(:pawn,:white,"a2")
    squares[6][1] = Pieces.create_piece(:pawn,:white,"b2")
    squares[6][2] = Pieces.create_piece(:pawn,:white,"c2")
    squares[6][3] = Pieces.create_piece(:pawn,:white,"d2")
    squares[6][4] = Pieces.create_piece(:pawn,:white,"e2")
    squares[6][5] = Pieces.create_piece(:pawn,:white,"f2")
    squares[6][6] = Pieces.create_piece(:pawn,:white,"g2")
    squares[6][7] = Pieces.create_piece(:pawn,:white,"h2")
    #
    # squares[7][0] = create_piece(:rook,  :white ,"Ra1")
    # squares[7][1] = create_piece(:knight,:white ,"Nb1")
    # squares[7][2] = create_piece(:bishop,:white ,"Bc1")
    # squares[7][3] = create_piece(:queen, :white ,"Qd1")
    # squares[7][4] = create_piece(:king,  :white ,"Ke1")
    # squares[7][5] = create_piece(:bishop,:white ,"Bf1")
    # squares[7][6] = create_piece(:knight,:white ,"Ng1")
    # squares[7][7] = create_piece(:rook,  :white ,"Rh1")
  end

end

# system("clear")
# b = Board.new
# # b.fill_square("a3",b.value_from("b2"))
# b.fill_square("a3",b.value_from("a7"))
# pieces = Pieces.new(b)
# piece_2 = b.value_from("b2")
# pieces.move(piece_2,"b4")
# b.draw_board
#
# print "Move Pa2 to Pa3"
# from = gets.chomp
# to   = gets.chomp
#
# piece = b.value_from(from)
#
# puts "Piece = #{piece.inspect}"
# pieces.move(piece,to)
# puts "Piece = #{piece.inspect}"
# system("clear")
# b.draw_board
