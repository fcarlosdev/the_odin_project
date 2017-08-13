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
      break if !take_turn
      break if game_over?
      switch_player
    end
    end_of_game_actions
  end

  private

  def take_turn
    clear_screen
    display_board
    verify_check
    move
  end

  def game_over?
    @status = :checkmate if game_status.checkmate?(enemy_player)
    @status = :draw if game_status.stalemate?(enemy_player)
    [:checkmate,:draw].include?(@status)
  end

  def verify_check
    if game_status.check?(current_player)
      puts "WARNING: The #{current_player.name} #{current_player.color} is in check"
    end
  end

  def move
    puts "To end the game enter 'exit' or 'save'."
    puts "Its your turn #{current_player.name}, your pieces are (#{current_player.color}) pieces."
    valid_enter = false
    while !valid_enter do
      from = enter_move("Move the piece at: ")
      break if stop_game?(from)
      if valid_enter?(from)
        piece = board.value_from(from)
        to = enter_move("Move #{piece.type} to: ")
        break if stop_game?(to)
        return @move_piece.move(piece,to) if valid_enter?(to)
      end
    end
    false
  end

  def enter_move(message)
    print message
    gets.chomp
  end

  def valid_enter?(value)
    if !("a".."h").include?(value[0]) || !(1..8).include?(value[1].to_i)
     puts "ERROR Invalid enter! Try again."
     return false
    end
    true
  end

  def stop_game?(action)
    message = {exit: "Existing from the game...",
               save: "Saving the the game..."}
    action_executed = ["exit","save"].include?(action)
    if action_executed
      puts message[action.to_sym]
      sleep(2)
    end
    action_executed
  end

  def end_of_game_actions
    clear_screen
    display_board
    display_messages
  end

  def display_messages
    if status == :checkmate
      p "The #{current_player.name} make a checkmate move, end of the game"
    elsif status == :draw
      puts "Draw"
      p "It's a draw"
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
