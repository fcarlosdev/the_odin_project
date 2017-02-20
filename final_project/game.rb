require './board.rb'
require './player.rb'

class Game

  attr_reader :board, :players, :current_player, :has_moved_piece

  def initialize(board, players)
    @board   = board
    @players = players
    @current_player = set_current_player
    @has_moved_piece = false
  end

  def play
    loop do
      take_turn
      break if game_over?
    end
  end

  #Unfinish in construction
  def game_over?
    color = (current_player.color == "white") ? "black" : "white"
    king = board.get_king_color(color)
    moves = king.possible_moves.select {|m| PiecesHelper.on_limits?(m)}.collect {|m| PiecesHelper.axis_to_position(m)}

    moves.each do |m|
      piece = board.get_piece(m)
      if (piece != "" && piece.color != king.color)
        opponent_moves = piece.possible_moves.select {|m| PiecesHelper.on_limits?(m)}.collect {|m| PiecesHelper.axis_to_position(m)}
        puts "Opponent #{piece.type} moves = #{opponent_moves.inspect}"
        return true
      end
    end
    false
  end

  private

  def take_turn
    clear_screen
    display_board
    if !move_piece(require_movements)
      puts "Invalid movement, try again"
      sleep(1)
    else
      @has_moved_piece = true
      change_player
    end
  end

  def move_piece(xy)
    (!empty_cell?(xy[0]) && owner_of_piece?(xy[0]) && move_ok?(xy[0],xy[1]))
  end

  def require_movements
    puts "Turn of the #{current_player.name}"
    print "Move one piece from (Ex.:pf2): "
    from = current_player.move_piece
    print "Move the piece #{from} to (Ex.:pf3): "
    to = current_player.move_piece
    [from,to]
  end

  def display_board
    return (@has_moved_piece) ? board.draw_board(board.cells) : board.draw_board
  end

  def set_current_player
    (players[0].color == "white") ? players[0] : players[1]
  end

  def change_player
    @current_player = players.find {|p| p if current_player != p }
  end

  def clear_screen
    system("clear")
  end

  def owner_of_piece?(position)
    @current_player.color == piece_on(position).color
  end

  def piece_on(position)
    board.get_piece(position)
  end

  def empty_cell?(position)
    board.empty_cell?(position)
  end

  def move_ok?(from,to)
    board.move(from,to)
  end

end

# g = Game.new(Board.new(Array.new(8){Array.new(8,"")}), [Player.new("player1","white"), Player.new("player2","black")])
# g.play
