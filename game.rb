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
    @position = nil
  end

  def change_player
    @current_player = (@current_player == players[0]) ? players[1] : players[0]
  end

  def drop_a_piece(column,value)
    return false if @board.column_full?(column)
    next_empty_cell = @board.get_empty_cell_on_column(column)
    @board.fill_cell(next_empty_cell,value)
    @position = @board.position_of(next_empty_cell)
    true
  end

  def over?
    row = @position[0]
    col = @position[1]
    #Checking if row contains winning move
    values = (0..@board.rows).collect {|i| @board.cells[row][i]}.each_cons(4)
    result = values.any? {|c| c.all? {|v| v.value.eql?@current_player.piece.symbol}}
    #checking if column contains winning move
    # values = (0..@board.rows).collect {|i| @board.cells[i][col]}.each_cons(4)
    # result = values.any? {|c| c.all? {|v| v.value.eql?@current_player.piece.symbol}}
    result
  end

end
