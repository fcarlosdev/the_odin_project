class Board

    SIZE_OF_SQUARE = 6

    attr_reader :columns, :lines, :squares

    def initialize(columns=8, lines=8)
      @columns = columns
      @lines   = lines
      @piecies = load_pieces_of_board
      @left_margin = (columns.to_s.length <= 1) ? 3 : (3+columns.to_s.length)
      @squares = []
    end

    def draw_board(squares_to_print=[])
      @squares = squares_to_print

      print_letter_above_of_squares
      puts
      create_top_line
      puts
      @lines.times do |line|
        create_internal_squares(line)
      end
      puts
    end

    private

    def create_top_line
      print @piecies[:top_left_corner].rjust(@left_margin)
      columns.times do |c|
        create_horizontal_line
        print @piecies[:top_junction] if c < columns - 1
      end
      print @piecies[:top_right_corner]
    end

    def create_horizontal_line
      print @piecies[:horizontal_line] * SIZE_OF_SQUARE
    end

    def create_internal_squares(line)
      print "#{@lines-line}".rjust(@left_margin-1)
      (columns+1).times do |col|
        if (columns == 8)
          print @piecies[:vertical_line].rjust( (col==0) ? 1 : (SIZE_OF_SQUARE-(columns/2)+2) )
          print (@squares.include?([line,col]) && col < columns) ? "K".rjust((columns/2)-1)
                                                                 : "".rjust((columns/4)+1)
        else
          print @piecies[:vertical_line].rjust( (col==0) ? 1 : (SIZE_OF_SQUARE-(columns/2)) )
          print (@squares.include?([line,col]) && col < columns) ? "K".rjust((columns/4)+3)
                                                                 : "".rjust((columns/2)+1)
        end
      end
      puts
      create_left_lines_of_border_of_inner_squares(line)
      create_inner_lines_of_square(line)
      create_right_lines_of_border_of_inner_squares(line)
      puts
    end

    def create_left_lines_of_border_of_inner_squares(line)
      print (line < @lines-1) ? @piecies[:left_junction].rjust(@left_margin)
                              : @piecies[:bottom_left_corner].rjust(@left_margin)
    end

    def create_inner_lines_of_square(line)
      columns.times do |col|
        create_horizontal_line
        if (col < @columns - 1)
         print (line < @lines - 1) ? @piecies[:middle_junction]
                                   : @piecies[:bottom_junction]
        end
      end
    end

    def create_right_lines_of_border_of_inner_squares(line)
      print (line < @lines-1) ? @piecies[:right_junction]
                              : @piecies[:bottom_right_corner]

    end

    def load_pieces_of_board
      return {
        :top_left_corner     => "\u250c", :top_right_corner   => "\u2510",
        :horizontal_line     => "\u2500", :top_junction       => "\u252c",
        :vertical_line       => "\u2502", :left_junction      => "\u251c",
        :middle_junction     => "\u253C", :right_junction     => "\u2524",
        :bottom_junction     => "\u2534", :bottom_left_corner => "\u2514",
        :bottom_right_corner => "\u2518"
      }
    end

    def print_letter_above_of_squares
      print "".ljust(2) if @left_margin > 3 #Necessary when the number of squares is bigger than 9
      ('a'..'z').take(columns).each {|l| print (l.eql?'a')? l.rjust((SIZE_OF_SQUARE/2)+3) : l.rjust((SIZE_OF_SQUARE/2)+4) }
    end

end
