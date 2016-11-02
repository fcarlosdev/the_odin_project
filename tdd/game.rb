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
    #winning move is in a line
      #get the line
    values = (0..@board.columns).collect {|row| @board.cells[@position[0]][row].value }
    group_values = values.each_cons(4)
    group_values.all?{|v| v == :FILLED_DISC }
  end

end
