require './board.rb'
require './player.rb'

class Game

  attr_reader :board, :players, :current_player, :from, :to

  def initialize(board, players)
    @board           = board
    @players         = players
    @current_player  = set_current_player
    @valid_move      = false
    @from            = ""
    @to              = ""
  end

  def play
    loop do
      take_turn
      if !move_piece(from,to)
        display_error_message
        redo
      end
      break if game_over?
      switch_player
    end
  end

  def game_over?
    (!empty_cell?(to) && check?(piece_on(to)) )
  end

  private

  def take_turn
    clear_screen
    display_board
    enter_moves
  end

  def enter_moves
    puts "Turn of the #{current_player.name}"
    print "Move one piece from (Ex.:pf2): "
    @from = current_player.move_one_piece
    print "Move the piece #{from} to (Ex.:pf3): "
    @to = current_player.move_one_piece
    puts "From = #{from}, To = #{to}"
  end

  def move_piece(from,to)
    (!empty_cell?(from) && owner_of_piece?(from) && move_ok?(from,to))
  end

  def check?(piece)
    piece.capture_moves.include?(get_opponent_king.position[1,2]) &&
          has_no_scape_move?(piece.capture_moves,get_opponent_king)
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

  def get_opponent_king
    board.get_king_color(get_color_opponent_king)
  end

  def get_color_opponent_king
    (current_player.color == "white") ? "black" : "white"
  end

end

# g = Game.new(Board.new(Array.new(8){Array.new(8,"")}), [Player.new("player1","white"), Player.new("player2","black")])
# g.play
