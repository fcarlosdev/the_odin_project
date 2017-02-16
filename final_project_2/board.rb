require 'colorize'
require 'colorized_string'
require "./pieces.rb"

class Board

  include Pieces

  attr_reader :columns, :rows, :cells

  def initialize(cells)
    @rows           = cells.length
    @columns        = cells.length
    @cells          = cells
    @bg_colors      = [:light_white, :cyan]
    @size_of_square = 8
  end

  def draw_board
    create_lines(bg_colors[0])
    puts "".center(7)+(97.chr..(97+7).chr).to_a.join("".center(8))
  end

  def load_pieces

    cells[0][0] = Rook.new(color:   "black", position: "Ra8")
    cells[0][1] = Knight.new(color: "black", position: "Nb8")
    cells[0][2] = Bishop.new(color: "black", position: "Bc8")
    cells[0][3] = Queen.new(color:  "black", position: "Qd8")
    cells[0][4] = King.new(color:   "black", position: "Ke8")
    cells[0][5] = Bishop.new(color: "black", position: "Bf8")
    cells[0][6] = Knight.new(color: "black", position: "Ng8")
    cells[0][7] = Rook.new(color:   "black", position: "Rh8")
    cells[1][0] = Pawn.new(color:   "black", position: "Pa7")
    cells[1][1] = Pawn.new(color:   "black", position: "Pb7")
    cells[1][2] = Pawn.new(color:   "black", position: "Pc7")
    cells[1][3] = Pawn.new(color:   "black", position: "Pd7")
    cells[1][4] = Pawn.new(color:   "black", position: "Pe7")
    cells[1][5] = Pawn.new(color:   "black", position: "Pf7")
    cells[1][6] = Pawn.new(color:   "black", position: "Pg7")
    cells[1][7] = Pawn.new(color:   "black", position: "Ph7")

    cells[6][0] = Pawn.new(color:   "white", position: "Pa2")
    cells[6][1] = Pawn.new(color:   "white", position: "Pb2")
    cells[6][2] = Pawn.new(color:   "white", position: "Pc2")
    cells[6][3] = Pawn.new(color:   "white", position: "Pd2")
    cells[6][4] = Pawn.new(color:   "white", position: "Pe2")
    cells[6][5] = Pawn.new(color:   "white", position: "Pf2")
    cells[6][6] = Pawn.new(color:   "white", position: "Pg2")
    cells[6][7] = Pawn.new(color:   "white", position: "Ph2")
    cells[7][0] = Rook.new(color:   "white", position: "Ra1")
    cells[7][1] = Knight.new(color: "white", position: "Nb1")
    cells[7][2] = Bishop.new(color: "white", position: "Bc1")
    cells[7][3] = Queen.new(color:  "white", position: "Qd1")
    cells[7][4] = King.new(color:   "white", position: "Ke1")
    cells[7][5] = Bishop.new(color: "white", position: "Bf1")
    cells[7][6] = Knight.new(color: "white", position: "Ng1")
    cells[7][7] = Rook.new(color:   "white", position: "Rh1")

  end

  private

  def create_lines(bg_color)
    rows.times do |row|
      puts "".center(3) + create_columns(bg_color)
      puts "#{rows-row}".center(3) + create_columns(cells[row], bg_color)
      puts "".center(3) + create_columns(bg_color)
      bg_color = switch_color_of_square(bg_color)
    end
  end

  def create_columns(pieces=nil, bg_color)
    line = ""
    columns.times do |col|
      tmp_piece = (pieces != nil && pieces[col] != "") ? pieces[col].icon : ""
      line += tmp_piece.center(size_of_square).colorize(:color => :black, :background => bg_color)
      bg_color = switch_color_of_square(bg_color)
    end
    line
  end

  def switch_color_of_square(current_bg_color)
    bg_colors.find {|color| color != current_bg_color}
  end

end

# system("clear")
# b = Board.new(Array.new(8){Array.new(8,"")})
# b.load_pieces
# puts b.draw_board
# pawn = b.cells[1][0]
# 4.times do |i|
#   b.cells[(i+2)][0] = pawn
#   b.cells[(i+1)][0] = ""
#   sleep(1)
#   system("clear")
#   puts b.draw_board
# end
# b.cells[5][0] = ""
# b.cells[6][1] = pawn
# sleep(1)
# system("clear")
# puts b.draw_board
#
# pawn_b = b.cells[6][0]
# 4.times do |i|
#   b.cells[(6-(i+1))][0] = pawn_b
#   b.cells[(6-i)][0] = ""
#   sleep(1)
#   system("clear")
#   puts b.draw_board
# end
# b.cells[1][1] = pawn_b
# b.cells[2][0] = ""
# sleep(1)
# system("clear")
# puts b.draw_board
