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

end
