require_relative "pieces"

class EndGameMoves

  include Pieces

  attr_reader :opponents, :movements, :opponents_moves, :king_moves,
              :board, :pieces

  def initialize(opponents,board,movements,pieces=nil)
    @opponents  = opponents
    @movements  = movements
    @board      = board
    @pieces     = pieces
  end

end
