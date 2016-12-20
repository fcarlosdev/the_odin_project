require 'colorize'
require 'colorized_string'

class Board

  attr_reader :rows, :columns, :color, :bg_colors, :size_of_square,
              :pieces

  def initialize
    @rows           = 8
    @columns        = 8
    @color          = :black
    @bg_colors      = [:light_white, :cyan]
    @pieces         = Array.new(8) {Array.new(8,"")}
    @size_of_square = 9
    load_pieces
  end

  def load_pieces
    @white_pieces = {
      :white_king  => "\u2654", :white_queen => "\u2655", :white_rook => "\u2656",
      :white_bishop => "\u2657", :white_knight => "\u2658", :white_pawn => "\u2659"
    }
    @black_pieces = {
      :black_king  => "\u265A", :black_queen => "\u265B", :black_rook => "\u265C",
      :black_bishop => "\u265D", :black_knight => "\u265E", :black_pawn => "\u265F"
    }

    @pieces[0][0] = @black_pieces[:black_rook]
    @pieces[0][1] = @black_pieces[:black_knight]
    @pieces[0][2] = @black_pieces[:black_bishop]
    @pieces[0][3] = @black_pieces[:black_queen]
    @pieces[0][4] = @black_pieces[:black_king]
    @pieces[0][5] = @black_pieces[:black_bishop]
    @pieces[0][6] = @black_pieces[:black_knight]
    @pieces[0][7] = @black_pieces[:black_rook]
    @pieces[1][0] = @black_pieces[:black_pawn]
    @pieces[1][1] = @black_pieces[:black_pawn]
    @pieces[1][2] = @black_pieces[:black_pawn]
    @pieces[1][3] = @black_pieces[:black_pawn]
    @pieces[1][4] = @black_pieces[:black_pawn]
    @pieces[1][5] = @black_pieces[:black_pawn]
    @pieces[1][6] = @black_pieces[:black_pawn]
    @pieces[1][7] = @black_pieces[:black_pawn]

    @pieces[6][0] = @white_pieces[:white_rook]
    @pieces[6][1] = @white_pieces[:white_knight]
    @pieces[6][2] = @white_pieces[:white_bishop]
    @pieces[6][3] = @white_pieces[:white_queen]
    @pieces[6][4] = @white_pieces[:white_king]
    @pieces[6][5] = @white_pieces[:white_bishop]
    @pieces[6][6] = @white_pieces[:white_knight]
    @pieces[6][7] = @white_pieces[:white_rook]
    @pieces[7][0] = @white_pieces[:white_pawn]
    @pieces[7][1] = @white_pieces[:white_pawn]
    @pieces[7][2] = @white_pieces[:white_pawn]
    @pieces[7][3] = @white_pieces[:white_pawn]
    @pieces[7][4] = @white_pieces[:white_pawn]
    @pieces[7][5] = @white_pieces[:white_pawn]
    @pieces[7][6] = @white_pieces[:white_pawn]
    @pieces[7][7] = @white_pieces[:white_pawn]
  end

  def draw_board

    bg_color = @bg_colors[0]

    @rows.times do |row|
      puts "".center(3) + create_line(bg_color)
      puts "#{@rows-row}".center(3) + create_line(@pieces[row], bg_color)
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

system('clear')
board = Board.new
board.draw_board
