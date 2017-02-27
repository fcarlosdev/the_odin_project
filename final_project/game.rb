require './board.rb'
require './player.rb'

class Game

  attr_reader :board, :players, :current_player, :from_to

  def initialize(board, players)
    @board           = board
    @players         = players
    @current_player  = set_current_player
    @valid_move      = false
    @from_to         = []
    @piece_moved     = nil
  end

  def play
    loop do
      take_turn
      if !move_piece(from_to)
        display_error_message
        redo
      end
      @piece_moved = piece_on(from_to[1])
      break if game_over?
      switch_player
    end
  end

  def game_over?
    color = (current_player.color == "white") ? "black" : "white"
    piece = piece_on(from_to[1])
    (piece != "") && check?(piece.capture_moves,board.get_king_color(color))
  end

  private

  def take_turn
    clear_screen
    display_board
    display_move_messages
  end

  def display_move_messages
    puts "Turn of the #{current_player.name}"
    print "Move one piece from (Ex.:pf2): "
    from = current_player.move_one_piece
    print "Move the piece #{from} to (Ex.:pf3): "
    to = current_player.move_one_piece
    from_to[0] = from
    from_to[1] = to
  end

  def move_piece(xy)
    (!empty_cell?(xy[0]) && owner_of_piece?(xy[0]) && move_ok?(xy[0],xy[1]))
  end

  def check?(capture_moves,king)
    capture_moves.include?(king.position[1,2]) && has_no_scape_move?(capture_moves,king)
  end

  def has_no_scape_move?(capture_moves,king)
    scape_moves(king).all?{|move| capture_moves.include?(move)}
  end

  def scape_moves(king)
    PiecesHelper.xy_to_rank_files(king.possible_moves).select {|m| piece_on(m) == ""}
  end

  def king_moves(king)
    PiecesHelper.xy_to_rank_files(king.possible_moves)
  end

  def display_board
    board.draw_board
  end

  def set_current_player
    (players[0].color == "white") ? players[0] : players[1]
  end

  def switch_player
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

  def display_error_message
    puts "Invalid movement, try again"
    sleep(1)
  end

end

# g = Game.new(Board.new(Array.new(8){Array.new(8,"")}), [Player.new("player1","white"), Player.new("player2","black")])
# g.play
