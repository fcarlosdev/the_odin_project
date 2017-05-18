require_relative "board"
require_relative "player"
require_relative "pieces/movements"
require_relative "pieces/pieces"
require_relative "pieces/mapper"

class Game

  include Pieces
  include Mapper

  attr_reader :board, :players, :current_player, :movements

  def initialize(board,players)
    @board          = board
    @players        = players
    @movements      = create_movements(board)
    @current_player = default_player
  end

  def play
    loop do
      if take_turn
        break if game_over?
        switch_players
      else
        puts "Invalid move, try again!"
        redo
      end
    end
    end_of_match_actions
  end

  private

  def take_turn
    clear_screen
    display_board
    move_piece
  end

  def game_over?
    board.game_over?(board.value_from(opponent_king_at),movements)
  end

  def end_of_match_actions
    clear_screen
    display_board
    display_message
  end

  def display_message
    if game_over? == "checkmate"
      p "The player #{current_player.name} winning the game!"
    elsif game_over? == "draw"
      p "It's a Draw"
    end
  end

  def move_piece
    args = enter_move
    move(args[:piece],args[:from],args[:to])
  end

  def move(piece,from,to)
    (piece.color.eql?(@current_player.color_of_piece)) && movements.move(piece,from,to)
  end

  def enter_move
    puts "Make a move player #{current_player.name}"
    print "Piece from position Ex.:(Pawn on a2 enter Pa2):"
    origin = gets.chomp
    piece = board.value_from(origin)
    print "Move piece #{piece.type} to position Ex.:(Pawn to a3 enter Pa3):"
    destiny = gets.chomp
    {piece: piece, from: origin, to: destiny}
  end

  def switch_players
    @current_player = players.find {|player| player != @current_player }
  end

  def display_board
    board.draw_board
  end

  def clear_screen
    system('clear')
  end

  def default_player
    @players.find {|player| player.color_of_piece.eql?("white")}
  end

  def opposite_color
    @current_player.color_of_piece == "white" ? "black" : "white"
  end

  def opponent_king_at
    board.position_from(:king, opposite_color)
  end

end

g = Game.new(Board.new(8,8), [Player.new("player1","white"), Player.new("player2","black")])
g.play
