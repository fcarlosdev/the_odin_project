require 'colorize'
require 'colorized_string'

class Test

  attr_reader :size_of_square, :color, :bg_colors, :dark_bgColor, :light_bgColor,
              :white_pieces, :black_pieces, :numbers_of_rows

  def initialize
    @size_of_square = 8
    @color          = :black
    @bg_colors      = [:light_white, :cyan]
    @white_pieces = {
      :white_king  => "\u2654", :white_queen => "\u2655", :white_rook => "\u2656",
      :white_bishop => "\u2657", :white_knight => "\u2658", :white_pawn => "\u2659"
    }
    @black_pieces = {
      :black_king  => "\u265A", :black_queen => "\u265B", :black_rook => "\u265C",
      :black_bishop => "\u265D", :black_knight => "\u265E", :black_pawn => "\u265F"
    }
    @numbers_of_rows = create_left_colum_of_numbers
  end

  def draw_board
    square_color  = @bg_colors[0]
    piece         = @white_pieces[:white_king]
    size_of_square.times do |row|
      puts draw_row_of_squares(row, square_color, piece)
      square_color = switch_color_of_square(square_color)
      piece        = switch_piece(piece)
    end
    puts "".center(5) + create_bottom_row_of_letters
  end

  def draw_row_of_squares(row, initial_color, initial_piece)
    s_line        = s_middle_line = ""
    square_color  = initial_color
    piece         = initial_piece
    size_of_square.times do |col|
      s_line        += create_line("",size_of_square/2,square_color)
      s_middle_line += create_line(piece, (size_of_square/2), square_color)
      square_color   = switch_color_of_square(square_color)
      piece          = switch_piece(piece)
    end
    s_line = "".rjust(2) + s_line
    s_line + "\n" + "#{@numbers_of_rows[row]} ".rjust(2) + s_middle_line + "\n" + s_line
  end


  def set_color_square(item, color, background_color)
    item.colorize(:color => color, :background => background_color)
  end

  def create_line(item, size, background_color)
    set_color_square(item.rjust(size), :black, background_color) +
    set_color_square("".rjust(size), :black, background_color)
  end

  def switch_color_of_square(current_bg_color)
    @bg_colors.find {|color| color != current_bg_color}
  end

  def switch_piece(current_piece)
    (current_piece == @white_pieces[:white_king]) ? @black_pieces[:black_king] : @white_pieces[:white_king]
  end

  def create_left_colum_of_numbers
    (1..size_of_square).to_a.reverse
  end

  def create_bottom_row_of_letters
    letters = (97.chr .. (97 + size_of_square - 1).chr).to_a.join("".center(7))
  end


end

system('clear')
board = Test.new
board.draw_board
