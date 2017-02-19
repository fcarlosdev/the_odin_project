require "./pieces_helper.rb"

module Pieces

  class Piece

    attr_reader :color, :icon, :type, :position

    def initialize(args={})
      @color    = args[:color]
      @position = args[:position]
      @type = nil
      post_initialize
    end

    def post_initialize
      nil
    end

    def move_to(new_position)
        @position = new_position if valid_move?(new_position)
        @position == new_position
    end

    def valid_move?(position)
      PiecesHelper.xy_to_rank_files(possible_moves).include?(position[1..2])
    end

    def possible_moves
      raise NotImplementedError, "This #{self.class} cannot respond to:"
    end

  end

  class King < Piece

    def post_initialize
      @type = :king
      @icon = PiecesHelper.get_icon_of(self)
    end

    def valid_move?(position)
      inside_limits?(position) ? super(position) : false
    end

    def possible_moves
      PiecesHelper.move_one_square(@position,Directions.cardinal_and_ordinal)
    end

    private

    def inside_limits?(position)
      get_distance(position).all?{|d| d >= -1 && d <= 1}
    end

    def get_distance(new_position)
      (1..2).collect {|i| new_position[i].ord - @position[i].ord}
    end

  end

  class Rook < Piece

    def post_initialize
      @type = :rook
      @icon = PiecesHelper.get_icon_of(self)
    end

    def possible_moves
      PiecesHelper.move_till_limits(@position,Directions.cardinal)
    end

  end

  class Bishop < Piece

    def post_initialize
      @type = :bishop
      @icon = PiecesHelper.get_icon_of(self)
    end

    def possible_moves
      PiecesHelper.move_till_limits(@position,Directions.intercardinal)
    end

  end

  class Queen < Piece

    def post_initialize
      @type = :queen
      @icon = PiecesHelper.get_icon_of(self)
    end

    def possible_moves
      PiecesHelper.move_till_limits(@position,Directions.cardinal_and_ordinal)
    end

  end

  class Knight < Piece

    def post_initialize
      @type = :knight
      @icon = PiecesHelper.get_icon_of(self)
    end

    def possible_moves
      PiecesHelper.move_till_limits(@position,Directions.secondary)
    end

  end

  class Pawn < Piece

    attr_reader :capture_moves, :move_direction

    def post_initialize
      @type = :pawn
      @icon = PiecesHelper.get_icon_of(self)
      # @capture_moves = [[-1,1], [1,1], [-1,-1], [1,-1]]
      @move_direction = (self.color.to_s.include?"white") ? :NORTH : :SOUTH
      @moves = []
    end

    def possible_moves
      PiecesHelper.move_one_square(position,[move_direction])
    end

    def valid_move?(position)
      @moves << position
      if @moves.length == 1
        super(position)
      else
        (caputre_moves(position).include?(position_to_xy(position)) || super(position))
      end
    end

    private

    def caputre_moves(position)
      index =  @moves.find_index(position)
      PiecesHelper.move_one_square(@moves[index-1],Directions.intercardinal)
    end

    def position_to_xy(position)
      (PiecesHelper.position_to_axis(position))
    end

  end

end
