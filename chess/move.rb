class Move

    attr_reader :board, :piece

    def initialize(board)
      @board = board
    end

    def move(piece,from,to)
      set_piece(piece)
      raise NotImplementedError, "This #{self.class} cannot respond to:"
    end

end
