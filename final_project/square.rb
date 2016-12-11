class Square

  attr_reader :black, :content

  def initialize(black=false, content=nil)
    @black = black
    @content = content
  end

  def create
    (@black) ? black_square : white_square
  end

  private

  def black_square
    square = ""
    square += "\u2593" * 7 + "\n"
    square +=  ("\u2593" * 2).ljust(3) +  "#{@content}".ljust(2) + ("\u2593" * 2).rjust(2) + "\n"
    square +=  "\u2593" * 7
    square
  end

  def white_square
    square = ""
    # square += "\u2581" * 7  + "\n"
    square += "\u258F" +  "\u258F".rjust(7) + "\n"
    square += "\u258F" +  "#{@content}".rjust(3) + "\u258F".rjust(4) + "\n"
    square += "\u258F" +  "\u258F".rjust(7)
    # square += "\u2594" * 7
    square
  end

end


# s = Square.new(false,"\u2654")
# puts s.create
# puts
# s_black = Square.new(true,"\u265A")
# puts s_black.create
# puts
# s_empty = Square.new(true)
# puts s_empty.create
