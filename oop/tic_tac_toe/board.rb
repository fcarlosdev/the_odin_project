class Board

  def initialize
    @table = {A0: "", B0: "", C0: "",
              A1: "", B1: "", C1: "",
              A2: "", B2: "", C2: ""}
  end

  def filled_out?
    return !@table.has_value?("")
  end

  def fill_cell(cell,value)
    if (cell_exists?(cell).eql?false)
      puts "Cell doesn't exist. Example of correct cell 'A1' or 'a1'"
      return false
    elsif cell_empty?(cell).eql?false
      puts "Cell already filled, try other position."
      return false
    else
      @table[cell] = value
      return true
    end
  end

  def table
    @table
  end

  def draw_board
      column_identity = ["A","B","C"]
      line_number = [0,1,2]
      lines = @table.map{|k,v| v}
      system("clear")
      lines.each_with_index do |v,index|
        if (index == 0)
          print column_identity[0].rjust(4)
                                  .concat(column_identity[1].rjust(4))
                                  .concat(column_identity[2].rjust(4))
          puts
        end

        print line_number[index/3].to_s.ljust(3) if [0,3,6].include?index

        if ![2,5,8].include?index
          print "#{v.ljust(2)}| "
        else
          puts "#{v}"
          puts "  ---+---+---" if (index < 6)
        end
      end
  end

  def has_a_win?
    lines = @table.map{|k,v| v}
    values = ["X","0"]

    values.each do |value|
      return true if has_one_line_with_all_values_equals_to?(value,lines)
      return true if has_one_column_with_all_values_equals_to?(value,lines)
      return true if has_one_diagonal_with_all_values_equals_to?(value,lines)
    end
    return false
  end

  private

  def cell_exists?(cell)
    return @table.include?cell
  end

  def cell_empty?(cell)
    return (@table[cell].eql?"")
  end

  def has_all_values_equals?(values,value)
    values.all?{|v| v.eql?value}
  end

  def has_one_line_with_all_values_equals_to?(value,cells)
    (0..2).each do |i|
      if has_all_values_equals?(cells[(i*3)..(i*3)+2],value)
        return true
      end
    end
    return false
  end

  def has_one_column_with_all_values_equals_to?(value,cells)
    (0..2).each do |index|
      column = [cells[index], cells[index+3], cells[index+3+3]]
      if has_all_values_equals?(column,value)
        return true
      end
    end
    return false
  end

  def has_one_diagonal_with_all_values_equals_to?(value, cells)
    diagonal_has_winner = false
    (0..1).each do |index|
      diagonal = [cells[(index*2)], cells[(index+(4-index))], cells[(index + (8-index*3))]]
      if has_all_values_equals?(diagonal,value)
        return true
      end
    end
    return false
  end


end

# b = Board.new
# b.fill_cell(:A0,"0")
# b.fill_cell(:A1,"X")
# b.fill_cell(:A2,"X")
# b.fill_cell(:B0,"0")
# b.fill_cell(:B1,"0")
# b.fill_cell(:B2,"X")
# b.fill_cell(:C0,"X")
# b.fill_cell(:C1,"0")
# b.fill_cell(:C2,"0")
# puts b.filled_out?
# b.draw_board
# puts b.has_a_win?
