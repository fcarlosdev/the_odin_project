require "./modules/coordenates.rb"
require "./modules/distance.rb"

class Move

    include Coordenates
    include Distance

    attr_reader :board

    def initialize(board)
      @board = board
    end

    def move(piece,from,to)
      raise NotImplementedError, "This #{self.class} cannot respond to:"
    end

    def update_position_of(piece,from,to)
      board.fill_square(to,piece)
      board.fill_square(from,nil)
    end

    def empty_square?(at)
      ["",nil].include?(board.get_piece(at))
    end

    def opponent_of?(piece,at_position)
      board.get_piece(at_position).color != piece.color
    end

end
