require 'colorize'
require 'colorized_string'
require "./pieces.rb"

class Board

  include Pieces

  attr_reader :columns, :rows, :cells, :bg_colors, :size_of_square

  def initialize(cells)
    @rows           = cells.length
    @columns        = cells.length
    @cells          = cells
    @bg_colors      = [:light_white, :cyan]
    @size_of_square = 8
    init_cells
  end

  def draw_board(updated_cells=nil)
    create_lines(bg_colors[0])
    show_bottom_letters
  end

  def init_cells

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

  #refactor this method
  def move(from,to)
    return false if (from == to)
    piece = get_piece(from)
    if (piece.move_to(to))
      origin = to_xy(from)
      destiny = to_xy(to)
      cells[destiny[0]][destiny[1]] = piece
      cells[origin[0]][origin[1]] = ""
      update_cells(cells)
      true
    else
      false
    end
  end

  def to_xy(position)
    PiecesHelper.position_to_axis(position)
  end

  def get_piece(from)
    xy = to_xy(from)
    cells[xy[0]][xy[1]]
  end

  def get_king_color(color)
    cells.flatten.select {|piece| (piece != "" && piece != nil) && piece.type == :king && piece.color == color}[0]
  end

  def empty_cell?(position)
    get_piece(position) == ""
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

  def show_bottom_letters
    puts "".center(6)+(97.chr..(97+7).chr).to_a.join("".center(7))
  end

  def update_cells(updated_cells)
    cells = updated_cells
  end

end
