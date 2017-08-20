require "./lib/modules/pieces"
require "./lib/modules/mapper"

class Board

  include Pieces
  include Mapper

  EMPTY_STRING = ""
  SIZE = 8

  attr_reader :squares, :rows, :columns

  def initialize
    @rows      = SIZE
    @columns   = SIZE
    @bg_colors = [:light_white, :cyan]
    create_squares(rows,columns)
    load_pieces
  end

  def move_piece(piece,to)
    fill_square(to,piece)
    fill_square(piece.position,nil)
    piece.position = to
    piece.increment_moves
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

  def load_pieces
    rows = [0,1,6,7]
    cols = (0..7).to_a
    index = 0;

    pieces = Pieces.create_pieces

    rows.each do |row|
      cols.each do |col|
        squares[row][col] = pieces[index]
        index += 1
      end
    end
  end

end
