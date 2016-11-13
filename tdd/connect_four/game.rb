require "./board.rb"
require "./player.rb"
require "./piece.rb"
require "./cell.rb"

class Game

  attr_accessor :board, :players, :current_player, :position

  def initialize(board, players)
    @board = board
    @players = players
    @current_player = players[0]
  end

  def change_player
    @current_player = (@current_player == players[0]) ? players[1] : players[0]
  end

  def fill_position(column,value)
    return false if @board.column_full?(column)
    @position = @board.get_position(empty_cell_of(column))
    set_position(@position,value)
    return true
  end

  def over?
    winning_move?
  end

  def draw?
    @board.cells.all? {|row| row.all? {|c| c.value.length > 0}}
  end

  private

  def set_position(axis,value)
    @board.fill(@board.cells[axis.first][axis.last],value)
  end

  def empty_cell_of(column)
    @board.get_empty_cell_on_column(column)
  end

  def winning_move?
    return true if winning_move_column?
    return true if winning_move_on_row?
    return true if winning_move_on_left_diagonal?
    return true if winning_move_on_right_diagonal?
    return false
  end

  def winning_move_column?
    has_winning_move?((0..@board.rows).collect {|i| @board.cells[i][@position.last]}.each_cons(4))
  end

  def winning_move_on_row?
    has_winning_move?((0..@board.columns).collect {|col| @board.cells[@position.first][col]}.each_cons(4))
  end

  def winning_move_on_left_diagonal?
    values = []
    row = @position.first
    col = @position.last
    values << values_up_position_left_diagonal(row,col) << values_down_position_left_diagonal(row,col)
    has_winning_move?(values.flatten.compact.each_cons(4))
  end

  def winning_move_on_right_diagonal?
    values = []
    row = @position.first
    col = @position.last
    values << values_up_position_right_diagonal(row,col) << values_down_position_right_diagonal(row,col)
    has_winning_move?(values.flatten.compact.each_cons(4))
  end

  def values_up_position_left_diagonal(row, col)
    (0..row).collect {|i| @board.cells[row-i][col-i] if valid_position?(row-i,col-i)}.flatten.reverse
  end

  def values_down_position_left_diagonal(row,col)
    (1..@board.rows-row).collect {|i| @board.cells[row+i][col+i] if valid_position?(row+i,col+i)}.flatten.reverse
  end

  def values_up_position_right_diagonal(row,col)
    (0..@board.rows-row).collect {|i| @board.cells[row+i][col-i] if valid_position?(row+i,col-i) }.flatten.reverse
  end

  def values_down_position_right_diagonal(row,col)
    (1..row).collect {|i| @board.cells[row-i][col+i] if valid_position?(row-i,col+i) }.flatten.reverse
  end

  def valid_position?(row,column)
    (row).between?(0,@board.rows) && (column).between?(0,@board.columns)
  end

  def has_winning_move?(values)
    values.any? {|row| row.all?{|cell| cell.value == current_player.piece.symbol}}
  end

end
