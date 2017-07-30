require './lib/board.rb'
require './lib/move_piece'

class Game

  attr_reader :players, :current_player, :board, :move_piece

  def initialize(players)
    @players = players
    @board   = Board.new
    @move_piece = MovePiece.new(board)
    @current_player ||= players[0]
  end

  def play
    loop do
      take_turn
      break if game_over?
    end
  end


  private

  def take_turn
    clear_screen
    display_board
    move_piece
  end

  def move_piece
    false
  end

  def game_over?
    #
  end

  
  def clear_screen
    system('clear')
  end

  def display_board
    board.draw_board
  end

  def current_player_take_turn
    current_player.take_turn
  end

end
