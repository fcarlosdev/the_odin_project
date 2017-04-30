require_relative "board"
require_relative "player"
require_relative "movement"
require_relative "pieces"
require_relative "movement"

class Game

  include Pieces

  attr_reader :board, :movement

  def initialize(board)
    @board = board
    @movement = Movement.new(board)
  end

  def make_move(piece,from,to)
    true
  end

end
