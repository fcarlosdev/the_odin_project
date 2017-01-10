require 'colorize'
require 'colorized_string'
require "./module/pieces.rb"

class Board

  include Pieces

  ROWS    = 8
  COLUMNS = 8
  LINE_COLOR = :black

  attr_reader :rows, :columns, :color, :bg_colors, :size_of_square,
              :pieces

  def initialize
    @rows           = ROWS
    @columns        = COLUMNS
    @color          = LINE_COLOR
    @bg_colors      = [:light_white, :cyan]
    @board         = Array.new(ROWS) {Array.new(COLUMNS,"")}
    @size_of_square = 9
    load_pieces
  end

  def load_pieces
    @board[0][0] = ICONS[:black_rook]
    @board[0][1] = ICONS[:black_knight]
    @board[0][2] = ICONS[:black_bishop]
    @board[0][3] = ICONS[:black_queen]
    @board[0][4] = ICONS[:black_king]
    @board[0][5] = ICONS[:black_bishop]
    @board[0][6] = ICONS[:black_knight]
    @board[0][7] = ICONS[:black_rook]
    @board[1][0] = ICONS[:black_pawn]
    @board[1][1] = ICONS[:black_pawn]
    @board[1][2] = ICONS[:black_pawn]
    @board[1][3] = ICONS[:black_pawn]
    @board[1][4] = ICONS[:black_pawn]
    @board[1][5] = ICONS[:black_pawn]
    @board[1][6] = ICONS[:black_pawn]
    @board[1][7] = ICONS[:black_pawn]

    @board[6][0] = ICONS[:white_pawn]
    @board[6][1] = ICONS[:white_pawn]
    @board[6][2] = ICONS[:white_pawn]
    @board[6][3] = ICONS[:white_pawn]
    @board[6][4] = ICONS[:white_pawn]
    @board[6][5] = ICONS[:white_pawn]
    @board[6][6] = ICONS[:white_pawn]
    @board[6][7] = ICONS[:white_pawn]
    @board[7][0] = ICONS[:white_rook]
    @board[7][1] = ICONS[:white_knight]
    @board[7][2] = ICONS[:white_bishop]
    @board[7][3] = ICONS[:white_queen]
    @board[7][4] = ICONS[:white_king]
    @board[7][5] = ICONS[:white_bishop]
    @board[7][6] = ICONS[:white_knight]
    @board[7][7] = ICONS[:white_rook]
  end

  def draw_board

    bg_color = @bg_colors[0]

    @rows.times do |row|
      puts "".center(3) + create_line(bg_color)
      puts "#{@rows-row}".center(3) + create_line(@board[row], bg_color)
      puts "".center(3) + create_line(bg_color)
      bg_color = switch_color_of_square(bg_color)
    end

    puts "".center(7)+(97.chr..(97+7).chr).to_a.join("".center(8))
  end

  def create_line(pieces=nil, bg_color)
    line = ""
    @columns.times do |col|
      tmp_piece = (pieces != nil) ? pieces[col] : ""
      line += tmp_piece.center(@size_of_square).colorize(:color => color, :background => bg_color)
      bg_color = switch_color_of_square(bg_color)
    end
    line
  end

  def switch_color_of_square(current_bg_color)
    @bg_colors.find {|color| color != current_bg_color}
  end

end

# system('clear')
# board = Board.new
# board.draw_board
