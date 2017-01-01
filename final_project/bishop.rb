require "./module/piece.rb"

class Bishop

    include Piece

    def initialize(color,position)
      super(color,position)
    end

    def move_to(position)
      @current_pos  = (super(position) && valid_move?(position)) ? position : @current_pos
    end

    private

    def valid_move?(position)
      position[0]=="B" && moved_only_along_diagonal?(position)
    end

    def moved_only_along_diagonal?(position)
      true
    end

end
