require_relative '../cell.rb'

class Testes
  attr_reader :cells, :rows, :columns

  def initialize(rows, columns)
    @cells = Array.new(rows) {Array.new(columns)}
    @rows = rows
    @columns = columns
    default_values
  end

  def default_values
    @rows.times do |r|
      @columns.times do |c|
        @cells[r][c] = Cell.new
      end
    end
  end

  def show
    @rows.times do |i|
      @columns.times do |j|
        print " #{cells[i][j].value} |" if cells[i][j].value.length > 0
        print " EMPTY |" if cells[i][j].value.length == 0
      end
      puts
    end
  end

  def fill_position(column,value)
    empty_pos = (0..rows-1).select {|row| row if @cells[row][column].value.length == 0}.last
    if (empty_pos != nil)
      @cells[empty_pos][column].value = value
      true
    else
      false
    end
  end

end

t = Testes.new(6,7)
8.times do |v|
  if !t.fill_position(3,"VALUE")
   puts "Column full" if v == 7
  end
end
t.show
