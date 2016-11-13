class Grid

  attr_accessor :board

  def initialize
    @board = Array.new(6){Array.new(7)}
  end

  def drop_piece(column,piece)
    if !is_filled?(column)
      line = get_line_with_space(column)
      @board[line][column] = piece
      return true
    end
    false
  end

  def winning_move?(with_piece)
    has_a_line_with_winning_move?(@board,with_piece) ||
    has_a_column_with_winning_move?(@board,with_piece) ||
    has_diagonal_with_winning_move?(@board,with_piece)
  end

  def draw_board
  end

  private

  def is_filled?(column)
    board.each_index.all? {|i| @board[i][column] != nil}
  end

  def get_line_with_space(column)
    @board.each_index.select{|i| i if @board[i][column] == nil }.last
  end

  def has_a_line_with_winning_move?(array,piece)

    winning_lines = @board.each_with_index.select do |item,index|
      item if item.count(piece) >= 4 &&
              item.slice(index,4).all?{|value| value.eql?piece}
    end
    (winning_lines != nil && winning_lines.size > 0)

  end

  def has_a_column_with_winning_move?(array,piece)

    winning_columns = @board.transpose.each_with_index.select do |item,index|
      item if item.count(piece) >= 4 &&
              item.slice(index,4).all?{|value| value.eql?piece}
    end
    (winning_columns != nil && winning_columns.size > 0)

  end

  def has_diagonal_with_winning_move?(array,piece)

    winning_diagonals = get_diagonals_of(@board).each_with_index.select do |item,index|
      item if item.count(piece) >= 4 &&
              item.slice(index,4).all?{|value| value.eql?piece}
    end
    (winning_diagonals != nil && winning_diagonals.size > 0)

  end

  def get_diagonals_of(array)
    diagonals = []
    diagonals << get_main_diagonal(array)
    diagonals << get_main_diagonal(array)
    diagonals << get_secondary_diagonal(array)
    diagonals << get_diagonals_below_of_main_diagonal(array)
    diagonals << get_diagonals_above_of_main_diagonal(array)
    diagonals << get_diagonals_below_of_secondary_diagonal(array)
    diagonals << get_diagonals_above_of_secondary_diagonal(array)
    diagonals
  end

  def get_main_diagonal(array)
    (0..5).collect{|i| array[i][i]}
  end

  def get_secondary_diagonal(array)
    (0..5).collect{|i| array[i][6-i]}
  end

  def get_diagonals_below_of_main_diagonal(array)
    diagonals = []
    (0..5).each do |l|
      tmp = ((l+1)..5).collect {|i| array[i][i-(l+1)]}
      diagonals << tmp if tmp.any?{|v| v != nil} && tmp.size >= 4
    end
    diagonals
  end

  def get_diagonals_above_of_main_diagonal(array)
    diagonals = []
    (0..5).each do |c|
      tmp = (0..(5-c)).collect {|i| array[i][i + (c+1)]}
      diagonals << tmp if tmp.any?{|v| v != nil} && tmp.size >= 4
    end
    diagonals
  end

  def get_diagonals_below_of_secondary_diagonal(array)
    diagonals = []
    (0..5).each do |i|
      tmp = (0..5).collect {|j| array[j+1][6] if j < (5-i)}
      right_down_diagonals << tmp if tmp.any?{|v| v != nil} && tmp.size >= 4
    end
    diagonals
  end

  def get_diagonals_above_of_secondary_diagonal(array)
    diagonals = []
    5.downto(0) do |i|
      tmp = (0..5).collect {|j| array[j][i-j] if (i-j) > -1}
      diagonals << tmp if tmp.any?{|v| v != nil} && tmp.size >= 4
    end
    diagonals
  end

end
