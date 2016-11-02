class Board

  attr_accessor :table

  def initialize
    @table = {A0: "", B0: "", C0: "",
              A1: "", B1: "", C1: "",
              A2: "", B2: "", C2: ""}
  end

  def filled_out?
    return !@table.has_value?("")
  end

  def fill_cell(cell,value)
    if (cell_exists?(cell) && cell_empty?(cell))
      @table[cell] = value
      return true
    end
    return false
  end

  def draw_board
    "   A   B   C\n"+
    "0  #{@table[:A0].rjust(1)} | #{@table[:B0].rjust(1)} | #{@table[:C0].rjust(1)} \n"+
    "  ---+---+---\n"+
    "1  #{@table[:A1].rjust(1)} | #{@table[:B1].rjust(1)} | #{@table[:C1].rjust(1)} \n"+
    "  ---+---+---\n"+
    "2  #{@table[:A2].rjust(1)} | #{@table[:B2].rjust(1)} | #{@table[:C2].rjust(1)} "
  end

  def has_a_winner?(value)
    winning_moves.any?{|moves| all_values_of?(moves,value)}
  end

  private

  def cell_exists?(cell)
    if (!@table.has_key?(cell))
      display_message_to_wrong_move(:WRONG_CELL)
      return false
    end
    return true
  end

  def cell_empty?(cell)
    if !@table[cell].eql?""
      display_message_to_wrong_move(:CELL_NOT_EMPTY)
      return false
    end
    return true
  end

  def all_values_of?(moves,value)
    moves.all? {|m| @table.values_at(m.to_sym).all? { |t| t == value} }
  end

  def winning_moves
    winning = [[:A0,:A1,:A2],[:B0,:B1,:B2],[:C0,:C1,:C2],
               [:A0,:B0,:C0],[:A1,:B1,:C1],[:A2,:B2,:C2],
               [:A0,:B1,:C2],[:C0,:B1,:A2] ]
  end

  def display_message_to_wrong_move(type_of_message)
    error_messages = {
      :WRONG_CELL => "Cell doesn't exist. Example of correct cell 'A1' or 'a1' ",
      :CELL_NOT_EMPTY => "Cell already filled, try other position. "
    }
    print error_messages[type_of_message]
    gets    
  end

end
