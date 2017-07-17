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

  def game_over?
  end

  def clear_screen
    system('clear')
  end

  def display_board
    board.draw_board
  end

  def move_piece

    positions = current_player_take_turn
    return false if valid_given_positions?(positions)
    return false if empty_position?(positions[0])

    attacker = board.value_from(positions[0])

    #select opponent king piece
    color = (attacker.color == :white) ? :black : :white;
    king = board.get_king(color)


    if move_piece.move(attacker,positions[1])
      
      if move_piece.free_way?(attacker.position,king.position) &&
          board.check?(king,attacker)
        puts "The King piece at #{king.position} is on check."
      end
      return true
    end
    false
  end

  def current_player_take_turn
    current_player.take_turn
  end

  def valid_given_positions?(positions)
    if !move_piece.valid_positions?(positions)
      puts "Invalid(s) position(s) given."
      return true
    end
    false
  end

  def empty_position?(from)
    if board.empty_place?(positions[0])
      puts "There is no piece in the #{positions[0]} position"
      return true
    end
    false
  end

end
