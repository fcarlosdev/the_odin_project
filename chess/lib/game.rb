require_relative "board"
require_relative "moves/movements"
require_relative "helpers/pieces"
require_relative 'helpers/mapper'

class Game

  include Pieces
  include Mapper

  attr_reader :board, :movements

  def initialize(board)
    @board     = board
    @movements = Movements.new(board)
  end

  def make_move(piece,from,to)
    movements.move(piece,from,to)
  end

end
