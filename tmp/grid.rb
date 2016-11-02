require "./cell.rb"

class Grid

  WIDTH_OF_CELL           = 3
  TOP_LEFT_CORNER         = "\u250c"
  HORIZONTAL_LINE         = "\u2500"
  TOP_LINE_JUNCTION       = "\u252c"
  TOP_RIGHT_CORNER        = "\u2510"
  VERTICAL_LINE           = "\u2502"
  INTERNAL_JUNCTION       = "\u251c"
  VERTICAL_LEFT_JUNCTION  = "\u251c"
  VERTICAL_RIGHT_JUNCTION = "\u2524"
  BOTTOM_LEFT_CORNER      = "\u2514"
  BOTTOM_JUNCTION         = "\u2534"
  BOTTOM_RIGHT_CORNER     = "\u2518"

  attr_reader :cells, :columns, :rows

  def initialize(rows,columns)
    @cells   = Array.new(rows) {Array.new(columns)}
    @rows    = rows-1
    @columns = columns-1
    default_values
  end

  def fill_cell(row,col,value)
    if (cell_empty?(row,col) == false)
      @cells[row][col].value = value
      return true
    end
    false
  end

  def draw_grid
    s_grid = ""
    s_grid += draw_top_line+"\n"
    s_grid += draw_inner_cell
    s_grid += draw_bottom_lines
    s_grid
  end

  def column_full?(column)
    (0..@rows-1).all?{|i| @cells[i][column].value.length > 0}
  end

  private

  def default_values
    (0..@rows).each_with_index do |row|
      (0..@columns).each_with_index do |col|
        @cells[row][col] = Cell.new
      end
    end
  end

  def cell_empty?(row,column)
    @cells[row][column].value.length > 0
  end

  def draw_top_line
    top_line = TOP_LEFT_CORNER
    (0..@columns).each do |col|
      top_line += HORIZONTAL_LINE * WIDTH_OF_CELL
      top_line += TOP_LINE_JUNCTION if col < @columns
    end
    top_line += TOP_RIGHT_CORNER
    top_line
  end

  def draw_inner_cell
    line           = 0
    vertical_lines = ""
    @cells.each do |row|
      v_line = VERTICAL_LINE
      row.each do |col|
        v_line += col.value.rjust(2)
        v_line +=VERTICAL_LINE.rjust(2)
      end
      vertical_lines += "#{v_line}\n"
      vertical_lines += draw_internal_junctions+"\n" if line < @rows
      line += 1
    end
    vertical_lines
  end

  def draw_internal_junctions
    junctions = ""
    junctions += VERTICAL_LEFT_JUNCTION
    (0..@columns).each do |col|
      junctions += (HORIZONTAL_LINE*WIDTH_OF_CELL) + INTERNAL_JUNCTION if col < @columns
    end
    junctions += (HORIZONTAL_LINE*WIDTH_OF_CELL) + VERTICAL_RIGHT_JUNCTION
    junctions
  end

  def draw_bottom_lines
    bottom_lines = ""
    bottom_lines += BOTTOM_LEFT_CORNER
    (0..@columns).each do |col|
      bottom_lines += HORIZONTAL_LINE*WIDTH_OF_CELL+BOTTOM_JUNCTION if col < @columns
    end
    bottom_lines += HORIZONTAL_LINE*WIDTH_OF_CELL+BOTTOM_RIGHT_CORNER
    bottom_lines
  end

end
