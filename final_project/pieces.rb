require "./pieces_helper.rb"

module Pieces

  class Piece

    attr_reader :color, :icon, :type, :position

    def initialize(args={})
      @color         = args[:color]
      @position      = args[:position]
      @type          = nil
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

    def possible_moves(position=nil)
      raise NotImplementedError, "This #{self.class} cannot respond to:"
    end

    def capture_moves
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
      PiecesHelper.move_till_two_squares(@position,Directions.cardinal_and_ordinal)
    end

    def capture_moves
      PiecesHelper.xy_to_rank_files(possible_moves)
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

    def capture_moves
      PiecesHelper.xy_to_rank_files(possible_moves)
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

    def capture_moves
      PiecesHelper.xy_to_rank_files(possible_moves)
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

    def capture_moves
      PiecesHelper.xy_to_rank_files(possible_moves)
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

    def capture_moves
      PiecesHelper.xy_to_rank_files(possible_moves)
    end

  end

  class Pawn < Piece

    attr_reader :move_direction
    # , :en_passant

    def post_initialize
      @type = :pawn
      @icon = PiecesHelper.get_icon_of(self)
      @move_direction = (self.color.to_s.include?"white") ? :NORTH : :SOUTH
      @new_position = ""
      # @en_passant  = false
    end

    def possible_moves
      move_by = (move_by_two?(position) && first_move?(position)) ? 2 : 1
      PiecesHelper.move_till_two_squares(position,[move_direction],move_by)
    end

    def valid_move?(position)
      set_new_position(position)
      (capture_moves(position).include?(position[1,2]) || super(position))
    end

    def capture_moves(position=nil)
      PiecesHelper.xy_to_rank_files(possible_capture_moves)
    end

    def is_en_passant(confirmation)
      @en_passant = confirmation
    end

    private

    def possible_capture_moves
      PiecesHelper.move_till_two_squares(position,Directions.intercardinal)
    end

    def set_new_position(position)
      @new_position = position
    end

    def move_by_two?(position)
      ((@new_position[2].to_i) - (position[2].to_i)).abs >= 2
    end

    def first_move?(position)
      ([2,7]).include?(position[2].to_i)
    end

  end

end
