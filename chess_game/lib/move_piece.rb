require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/distance"
require_relative "directions_new"


class MovePiece

  include Mapper
  include Coordenates
  include Distance

  attr_reader :move_pawn, :move_king,   :move_rook,
              :move_queen,:move_bishop, :move_knight,
              :moves

  def initialize(board)
    @move_pawn   = MovePawn.new(board)
    @move_bishop = MoveBishop.new(board)
    @move_king   = MoveKing.new(board)
    @move_queen  = MoveQueen.new(board)
    @move_rook   = MoveRook.new(board)
    @move_knight = MoveKnight.new(board)
    @moves       = set_moves
  end

  def move(piece,to)
    moves[piece.type].move(piece,to)
  end

  private

  def set_moves
    { pawn:  @move_pawn,  king:   @move_king,   rook:   @move_rook,
      queen: @move_queen, bishop: @move_bishop, knight: @move_knight }
  end

  def free_way?(piece,to)

    piece.path(to)
    # path_from(piece,to).all?{|place| empty_place?(place)}

  end



end
