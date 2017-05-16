require "colorize"
require_relative "pieces/pieces"
require_relative "pieces/mapper"

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

  def position_from(piece_type, from_color)
    piece_found = remove_nils_squares.select {|piece| piece.type == piece_type && piece.color == from_color}
    piece_found[0].current_position if piece_found.length > 0
  end

  def game_over?(king_piece,movements)
    return "checkmate" if checkmate?(king_piece,movements)
    # return "draw" if draw?
  end

  private

  def checkmate?(king_piece,movements)
    king_in_checkmate?(remove_nils_squares,king_piece,movements)
  end

  def draw?
    "draw"
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
    squares[0][0] = create_piece(:rook,   "black", "Ra8")
    squares[0][1] = create_piece(:knight, "black", "Nb8")
    squares[0][2] = create_piece(:bishop, "black", "Bc8")
    squares[0][3] = create_piece(:queen,  "black", "Qd8")
    squares[0][4] = create_piece(:king,   "black", "Ke8")
    squares[0][5] = create_piece(:bishop, "black", "Bf8")
    squares[0][6] = create_piece(:knight, "black", "Ng8")
    squares[0][7] = create_piece(:rook,   "black", "Rh8")

    squares[1][0] = create_piece(:pawn,"black","Pa7")
    squares[1][1] = create_piece(:pawn,"black","Pb7")
    squares[1][2] = create_piece(:pawn,"black","Pc7")
    squares[1][3] = create_piece(:pawn,"black","Pd7")
    squares[1][4] = create_piece(:pawn,"black","Pe7")
    squares[1][5] = create_piece(:pawn,"black","Pf7")
    squares[1][6] = create_piece(:pawn,"black","Pg7")
    squares[1][7] = create_piece(:pawn,"black","Ph7")

    squares[6][0] = create_piece(:pawn,"white","Pa2")
    squares[6][1] = create_piece(:pawn,"white","Pb2")
    squares[6][2] = create_piece(:pawn,"white","Pc2")
    squares[6][3] = create_piece(:pawn,"white","Pd2")
    squares[6][4] = create_piece(:pawn,"white","Pe2")
    squares[6][5] = create_piece(:pawn,"white","Pf2")
    squares[6][6] = create_piece(:pawn,"white","Pg2")
    squares[6][7] = create_piece(:pawn,"white","Ph2")

    squares[7][0] = create_piece(:rook,  "white" ,"Ra1")
    squares[7][1] = create_piece(:knight,"white" ,"Nb1")
    squares[7][2] = create_piece(:bishop,"white" ,"Bc1")
    squares[7][3] = create_piece(:queen, "white" ,"Qd1")
    squares[7][4] = create_piece(:king,  "white" ,"Ke1")
    squares[7][5] = create_piece(:bishop,"white" ,"Bf1")
    squares[7][6] = create_piece(:knight,"white" ,"Ng1")
    squares[7][7] = create_piece(:rook,  "white" ,"Rh1")
  end

end

# b = Board.new(8,8)
# b.value_from("Pa2")
