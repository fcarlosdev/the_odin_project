require './lib/board.rb'
require './lib/move_piece'
require './lib/game_status'

class Game

  attr_reader :players, :current_player, :board, :move_piece,
              :game_status, :status, :enemy_player

  def initialize(players)
    @players        = players
    @board          = Board.new
    @status         = :continue
    @move_piece     = MovePiece.new(board)
    @game_status    = GameStatus.new(move_piece,board)
    @current_player ||= players[0]
    @enemy_player   ||= players[1]
  end

  def play
    loop do
      take_turn
      break if game_over?
      switch_player
    end
    end_of_game_actions
  end

  private

  def take_turn
    clear_screen
    display_board
    move
  end

  def game_over?
    @status = :checkmate if game_status.checkmate?(enemy_player)
    @status = :draw if game_status.stalemate?(enemy_player)
    @status != :continue
  end

  def move
    print "Move the piece at: "
    from = gets.chomp
    print "Move #{board.value_from(from).type} to: "
    to = gets.chomp
    piece = board.value_from(from)
    @move_piece.move(board.value_from(from),to)
  end

  def end_of_game_actions
    clear_screen
    display_board
    puts "Status = #{status}"
    if status == :checkmate
      puts "The #{current_player.name} won the game"
    end
    if status == :draw
      puts "It's a draw"
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

  def switch_player
    @current_player = players.find { |player| player != current_player }
    set_enemy_player
  end

  def set_enemy_player
    @enemy_player = (current_player == players[0]) ? players[1] : players[0]
  end

end
