require "./piece.rb"
require "./module/allowed_moves.rb"

class Bishop < Piece

    include AllowedMoves

    def initialize(color,position)
      super(color,position)
    end

    def move_to(position)
      @current_pos  = valid_move?(position) ? super(position) : @current_position
    end

    private

    def valid_move?(position)
      super(position) && position[0]=="B" && valid_diagonal_move?(@current_position,position)
    end

end
