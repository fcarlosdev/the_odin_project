require "./pieces_util.rb"

module Pieces

  class Piece

    attr_reader :color, :icon, :type, :position

    def initialize(args={})
      @color    = args[:color]
      @position = args[:position]
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
      PiecesUtil.xy_to_rank_files(possible_moves).include?(position[1..2])
    end

    def possible_moves
      raise NotImplementedError, "This #{self.class} cannot respond to:"
    end

  end

  class King < Piece

    def post_initialize
      @type = :king
      @icon = PiecesUtil.get_icon_of(self)
    end

    def valid_move?(position)
      inside_limits?(position) ? super(position) : false
    end

    def possible_moves
      PiecesUtil.move_one_square(@position,Directions.cardinal_and_ordinal)
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
      @icon = PiecesUtil.get_icon_of(self)
    end

    def possible_moves
      PiecesUtil.move_till_limits(@position,Directions.cardinal)
    end

  end

  class Bishop < Piece

    def post_initialize
      @type = :bishop
      @icon = PiecesUtil.get_icon_of(self)
    end

    def possible_moves
      PiecesUtil.move_till_limits(@position,Directions.intercardinal)
    end

  end

  class Queen < Piece

    def post_initialize
      @type = :queen
      @icon = PiecesUtil.get_icon_of(self)
    end

    def possible_moves
      PiecesUtil.move_till_limits(@position,Directions.cardinal_and_ordinal)
    end

  end

  class Knight < Piece

    def post_initialize
      @type = :knight
      @icon = PiecesUtil.get_icon_of(self)
    end

    def possible_moves
      PiecesUtil.move_till_limits(@position,Directions.secondary)
    end

  end

  class Pawn < Piece

    attr_reader :capture_moves

    def post_initialize
      @type = :pawn
      @icon = PiecesUtil.get_icon_of(self)
      @capture_moves = [[-1,1], [1,1], [-1,-1], [1,-1]]
    end

    def possible_moves
      PiecesUtil.move_one_square(@position,Directions.north_south)
    end

  end

end
