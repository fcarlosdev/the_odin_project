require_relative "board"
require_relative "moves/movements"
require_relative "helpers/pieces"
require_relative 'helpers/mapper'

class Game

  include Pieces
  include Mapper

  attr_reader :board, :players, :current_player, :movements

  def initialize(board,players)
    @board     = board
    @players   = players
    @movements = Movements.new(board)
    @current_player = @players.find {|player| player.color_of_piece.eql?("white")}
  end

  def start
    clear_screen
    display_board
  end

  def move(piece,from,to)
    (piece.color.eql?(current_player.color_of_piece)) && movements.move(piece,from,to)
  end

  private

  def display_board
    board.draw_board
  end

  def clear_screen
    system('clear')
  end

end
