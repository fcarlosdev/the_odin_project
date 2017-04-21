require "./board.rb"
require "./player.rb"
require "./modules/pieces.rb"

class Game

  include Pieces

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def move_piece(from,to)
    true
  end

end
