require 'colorize'
require './king.rb'

class Board

  EMPTY_STRING = ""

  attr_reader :squares, :rows, :columns

  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    @bg_colors  = [:light_white, :cyan]
    create_squares(rows,columns)
  end

  def draw_board
    draw_squares(@bg_colors[0])
  end

  def load_pieces
    # squares[0][0] = Rook.new(color:   "black", position: "Ra8")
    # squares[0][1] = Knight.new(color: "black", position: "Nb8")
    # squares[0][2] = Bishop.new(color: "black", position: "Bc8")
    # squares[0][3] = Queen.new(color:  "black", position: "Qd8")
    squares[0][4] = King.new({color:'black', position: "Ke8"})
    # squares[0][5] = Bishop.new(color: "black", position: "Bf8")
    # squares[0][6] = Knight.new(color: "black", position: "Ng8")
    # squares[0][7] = Rook.new(color:   "black", position: "Rh8")
    # squares[1][0] = Pawn.new(color:   "black", position: "Pa7")
    # squares[1][1] = Pawn.new(color:   "black", position: "Pb7")
    # squares[1][2] = Pawn.new(color:   "black", position: "Pc7")
    # squares[1][3] = Pawn.new(color:   "black", position: "Pd7")
    # squares[1][4] = Pawn.new(color:   "black", position: "Pe7")
    # squares[1][5] = Pawn.new(color:   "black", position: "Pf7")
    # squares[1][6] = Pawn.new(color:   "black", position: "Pg7")
    # squares[1][7] = Pawn.new(color:   "black", position: "Ph7")

    # squares[6][0] = Pawn.new(color:   "white", position: "Pa2")
    # squares[6][1] = Pawn.new(color:   "white", position: "Pb2")
    # squares[6][2] = Pawn.new(color:   "white", position: "Pc2")
    # squares[6][3] = Pawn.new(color:   "white", position: "Pd2")
    # squares[6][4] = Pawn.new(color:   "white", position: "Pe2")
    # squares[6][5] = Pawn.new(color:   "white", position: "Pf2")
    # squares[6][6] = Pawn.new(color:   "white", position: "Pg2")
    # squares[6][7] = Pawn.new(color:   "white", position: "Ph2")
    # squares[7][0] = Rook.new(color:   "white", position: "Ra1")
    # squares[7][1] = Knight.new(color: "white", position: "Nb1")
    # squares[7][2] = Bishop.new(color: "white", position: "Bc1")
    # squares[7][3] = Queen.new(color:  "white", position: "Qd1")
    squares[7][4] = King.new({color:'white', position: "Ke1"})
    # squares[7][5] = Bishop.new(color: "white", position: "Bf1")
    # squares[7][6] = Knight.new(color: "white", position: "Ng1")
    # squares[7][7] = Rook.new(color:   "white", position: "Rh1")
  end

  def get_square(row,column)
    (row != nil && column != nil) ? squares[row][column] : nil
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

  def any_value_nil?(values=[])
    values.any? {|value| value == nil}
  end

  def create_squares(row,columns)
    @squares = Array.new(rows) {Array.new(columns)}
  end

end

b = Board.new(8,8)
b.load_pieces
b.draw_board
