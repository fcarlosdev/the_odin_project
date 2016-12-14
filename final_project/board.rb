class Board

  VERTICAL_LINE = "\u258F"
  DARK_SHADE    = "\u2593"

  attr_reader :rows, :columns, :cells

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @cells = []
  end

  def draw_board
    top_row     = "\u2581" * 56
    bottom_row  = "\u2594" * 56
    white_piece = "\u2658"
    black_piece = "\u265E"
    content    = "\u2593" * 3

    puts top_row

    4.times do |l|
      puts (draw_h_line + draw_top_line_black_square) * 4 + VERTICAL_LINE
      puts (draw_white_square(white_piece) + draw_black_square(black_piece)) * 4  + VERTICAL_LINE
      puts (draw_h_line + (DARK_SHADE * 7).ljust(6)) * 4 + VERTICAL_LINE

      puts ((DARK_SHADE * 7) + " ".rjust(7)) * 4 + VERTICAL_LINE
      puts ((DARK_SHADE * 2) + " #{black_piece} ".ljust(3) + (DARK_SHADE * 2) + "#{white_piece}".rjust(4)).ljust(14) * 4 + VERTICAL_LINE
      puts ((DARK_SHADE * 7) + " ".rjust(7)) * 4 + VERTICAL_LINE
    end

    puts bottom_row

  end

  private

  def draw_white_square(piece)
    (VERTICAL_LINE + "#{piece}".rjust(3))
  end

  def draw_black_square(piece)
    ((DARK_SHADE * 2).rjust(5) + " #{piece} ".ljust(3) + (DARK_SHADE * 2))
  end

  def draw_h_line
    VERTICAL_LINE.ljust(7)
  end

  def draw_top_line_black_square
    (DARK_SHADE * 7).ljust(6)

  end

end

system('clear')
b = Board.new(8,8)
b.draw_board
