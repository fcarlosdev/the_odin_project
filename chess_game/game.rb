require './lib/board.rb'
require './lib/move_piece'
require './lib/game_status'

class Game

  attr_reader :players, :current_player, :board, :move_piece,
              :game_status, :status

  def initialize(players)
    @players = players
    @board   = Board.new
    @move_piece = MovePiece.new(board)
    @current_player ||= players[0]
    @game_status = GameStatus.new(move_piece,board)
    @status = :continue
  end

  def play
    loop do
      take_turn
      break if game_over?
      # check?
      switch_player
    end

    puts "Status = #{status}"
    if status == :checkmate
      puts "The #{current_player.name} won the game"
    end
    if status == :draw
      puts "It's a draw"
    end

  end

  private

  def take_turn
    clear_screen
    display_board
    move
  end

  def game_over?
    # @status = :checkmate if game_status.checkmate?(enemy_player)
    # @status = :draw if game_status.stalemate?(enemy_player)
    # @status != :continue
    :continue
  end

  def move
    print "Move the piece at: "
    from = gets.chomp
    print "Move #{board.value_from(from).type} to: "
    to = gets.chomp
    @move_piece.move(board.value_from(from),to)
  end

  def check?
    if game_status.check?(enemy_player)
      puts "The #{enemy_player.name} is in check"
    end
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

  def enemy_player
    get_player_different_current_player
  end

  def switch_player
    @current_player = get_player_different_current_player
  end

  def get_player_different_current_player
    players.find {|player| player != current_player}
  end




end
