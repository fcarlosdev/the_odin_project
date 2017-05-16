require_relative "coordenates"
require_relative "distance"
require_relative "directions"

class Move

    include Coordenates
    include Distance
    include Directions

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
      ["",nil].include?(board.value_from(at))
    end

    def opponent_of?(piece,at_position)
      board.value_from(at_position).color != piece.color
    end

    def has_piece_between?(piece,from,to)
      if piece_type?(piece.type) && (calc_distance(from,to).abs > 1)
        return any_position_filled?(positions_between(from,to))
      end
      return false
    end

    def any_position_filled?(positions)
      positions.any? {|cell| !empty_square?(cell)}
    end

    def positions_between(from,to)
      positions = (from < to) ? (from..to) : (to..from)
      positions.select {|ps| ![from,to].include?(ps)}
    end

    def update_current_position(piece,new_position)
      piece.current_position = new_position
    end

    private

    def piece_type?(type)
      [:rook,:bishop,:queen].include?(type)
    end


end
