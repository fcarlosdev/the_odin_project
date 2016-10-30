require "./grid.rb"

class Board

  attr_accessor :grid, :last_line

  def initialize(rows,columns)
    @grid    = Grid.new(rows,columns)
    @columns = grid.columns
    @rows    = grid.rows
    @last_line = nil
  end

  def drop_a_piece(column,piece)
    column_full?(column) ? false : fill(position_of_empty_cell_on(column),column, piece.symbol)
  end

  def has_winning_move?(column,piece)
    return true if winning_move_in_column(column,piece.symbol)
    return true if winning_move_in_line(piece.symbol)
    false
  end

  def show
    puts @grid.draw_grid
  end

  def draw?
    @grid.cells.all?{|c| c.all? {|e| e.value.length > 0}}
  end

  private

   def column_full?(column)
     @grid.column_full?(column)
   end

   def position_of_empty_cell_on(column)
     (0..@rows).select {|row| row if @grid.cells[row][column].value.length == 0}.last
   end

   def get_position_empty_cell_on(column)
     rows = (0..@rows-1).select {|i| @board.grid.cells[i][column].value.length == 0}
     [rows.last,column]
   end


   def fill(row,column,value)
    @last_line = row
    @grid.fill_cell(row,column,value)
   end

   def winning_move_in_column(column,value)
     elements = (0..@rows).collect {|i| @grid.cells[i][column]}.each_cons(4)
     check_winning_move(elements,value)
   end

   def winning_move_in_line(value)
     elements = (0..@columns).collect {|i| @grid.cells[@last_line][i]}.each_cons(4)
     check_winning_move(elements,value)
   end

   def check_winning_move(elements, value)
     elements.any?{|v| v.all?{|c| c.value == value}}
   end


end
