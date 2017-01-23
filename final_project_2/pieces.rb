require "./pieces_util.rb"

module Pieces

  class Piece

    attr_reader :color, :icon, :type, :position

    def initialize(color,position=nil)
      @color = color
      @position = position
    end

    def move_to(new_position)
      valid_move?(new_position)
    end

    def valid_move?(new_position)
      PiecesUtil::FILE_LIMITS.include?(new_position[1]) &&
                              PiecesUtil::RANK_LIMITS.include?(new_position[2])
    end

  end

  class King < Piece

    def initialize(color,position=nil)
      super(color,position)
      @type = :king
      @icon = PiecesUtil.get_icon_of(self)
    end

    def move_to(new_position)
      @position = new_position if super(new_position) && valid_move?(new_position)
      @position == new_position
    end

    def valid_move?(position)
      if super(position) && inside_limits?(position)
        possible_moves = PiecesUtil.move_one_square(@position,PiecesUtil::ALL_DIRECTIONS)
        PiecesUtil.xy_to_rank_files(possible_moves).include?(position[1..2])
      end
    end

    private

    def inside_limits?(position)
      distance = get_distance(position)
      file_valid = distance[0] >= -1 && distance[0] <= 1
      rank_valid = distance[1] >= -1 && distance[1] <= 1
      file_valid && rank_valid
    end

    def get_distance(new_position)
      file_distance = new_position[1].ord - @position[1].ord
      rank_distance = new_position[2].to_i - @position[2].to_i
      distance = [file_distance, rank_distance]
    end

  end

  class Rook < Piece

    def initialize(color,position=nil)
      super(color,position)
      @type = :rook
      @icon = PiecesUtil.get_icon_of(self)
    end

    def move_to(new_position)
      @position = new_position if super(new_position) && valid_move?(new_position)
      @position == new_position
    end

    def valid_move?(new_position)
      if (super(new_position))
        possible_moves = PiecesUtil.move_till_limits(@position,[:NORTH,:SOUTH, :EAST, :WEST])
        PiecesUtil.xy_to_rank_files(possible_moves).include?(new_position[1..2])
      end
    end

  end

  class Bishop < Piece

    def initialize(color,position=nil)
      super(color,position)
      @type = :bishop
      @icon = PiecesUtil.get_icon_of(self)
    end

    def move_to(new_position)
      @position = new_position if super(new_position) && valid_move?(new_position)
      @position == new_position
    end

    def valid_move?(new_position)
      if (super(new_position))
        possible_moves = PiecesUtil.move_till_limits(@position,[:NE, :SE, :SW, :NW])
        PiecesUtil.xy_to_rank_files(possible_moves).include?(new_position[1..2])
      end
    end

  end

  class Queen < Piece

    def initialize(color,position=nil)
      super(color)
      @type = :queen
      @icon = PiecesUtil.get_icon_of(self)
    end

  end

  class Knight < Piece

    def initialize(color,position=nil)
      super(color)
      @type = :knight
      @icon = PiecesUtil.get_icon_of(self)
    end

  end

  class Pawn < Piece

    attr_reader :capture_moves

    def initialize(color,position=nil)
      super(color)
      @type = :pawn
      @icon = PiecesUtil.get_icon_of(self)
      @capture_moves = [[-1,1], [1,1], [-1,-1], [1,-1]]
    end

  end

end
