require './lib/board.rb'

class Game

  attr_reader :players, :current_player, :board

  def initialize(players)
    @players = players
    @board   = Board.new
    @current_player = select_current_player
  end

  def play
    system('clear')
    board.draw_board
    print "Move the piece at: "
    from = gets.chomp
    print "Move the pice #{board.value_from(from)}.type to: "
    to = gets.chomp
  end


  private

  def select_current_player
    players.find {|player| player.color == :white}
  end


end
