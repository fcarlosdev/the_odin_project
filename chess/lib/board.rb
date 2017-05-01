require "colorize"
require_relative "helpers/pieces"
require_relative "helpers/mapper"

class Board

  include Pieces
  include Mapper

  EMPTY_STRING = ""

  attr_reader :squares, :rows, :columns

  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    @bg_colors  = [:light_white, :cyan]
    create_squares(rows,columns)
    load_pieces
  end

  def draw_board
    draw_squares(@bg_colors[0])
  end

  def value_from(position)
    square = map_to_axis(position)
    squares[square[0]][square[1]]
  end

  def fill_square(position,value)
    at_xy = map_to_axis(position)
    squares[at_xy[0]][at_xy[1]] = value
  end

  private

  def get_square(row,column)
    (row != nil && column != nil) ? squares[row][column] : nil
  end

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

  def any_value_nil?(values=[])
    values.any? {|value| value == nil}
  end

  def create_squares(row,columns)
    @squares = Array.new(rows) {Array.new(columns)}
  end

  def load_pieces
    squares[0][0] = create_piece(:black_rook)
    squares[0][1] = create_piece(:black_knight)
    squares[0][2] = create_piece(:black_bishop)
    squares[0][3] = create_piece(:black_queen)
    squares[0][4] = create_piece(:black_king)
    squares[0][5] = create_piece(:black_bishop)
    squares[0][6] = create_piece(:black_knight)
    squares[0][7] = create_piece(:black_rook)
    8.times {|column| squares[1][column] = create_piece(:black_pawn)}

    8.times {|column| squares[6][column] = create_piece(:white_pawn)}

    squares[7][0] = create_piece(:white_rook)
    squares[7][1] = create_piece(:white_knight)
    squares[7][2] = create_piece(:white_bishop)
    squares[7][3] = create_piece(:white_queen)
    squares[7][4] = create_piece(:white_king)
    squares[7][5] = create_piece(:white_bishop)
    squares[7][6] = create_piece(:white_knight)
    squares[7][7] = create_piece(:white_rook)
  end

end

b = Board.new(8,8)
b.value_from("Pa2")
