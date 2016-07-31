class Player

  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def mark_cell(board,place,value)
    board.fill_cell(place,value)
  end

end
