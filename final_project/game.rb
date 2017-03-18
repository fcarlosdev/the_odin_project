require './board.rb'
require './player.rb'

class Game

  attr_reader :board, :players, :current_player, :from, :to

  def initialize(board, players)
    @board           = board
    @players         = players
    @current_player  = set_current_player
    @from            = ""
    @to              = ""
  end

  def play
    checkmate = false
    loop do
      take_turn
      if !move_piece(from,to)
        display_error_message
        redo
      end
      checkmate = game_over?
      break if checkmate
      switch_player
    end

    clear_screen
    if checkmate
      display_board
      puts "Checkmate, the player #{current_player.name}, won the game."
    else
      puts "End game, and have no winner."
    end
  end

  def game_over?
    (!empty_cell?(to) && check?(piece_on(to),get_opponent_king) )
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
  end

  def move_piece(from,to)
    !empty_cell?(from) && is_your_piece?(from) && square_clear?(to) && move_ok?(from,to)
  end

  def check?(piece,opponent_king)
    opponent_king_capturable?(opponent_king.position[1,2],piece) &&
      king_has_no_scape_move?(opponent_king,piece) &&
        !piece_on_way?(opponent_king.position[1,2],piece)
  end

  def opponent_king_capturable?(king_position,piece)
    piece.capture_moves.include?(king_position)
  end

  def king_has_no_scape_move?(king,piece)
    scape_moves(king).all?{|move| piece.capture_moves.include?(move)}
  end

  def scape_moves(king)
    king.scape_moves.select {|m| piece_on(m) == ""}
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

  def is_your_piece?(position)
    same_color?(piece_on(position))
  end

  def piece_on(position)
    board.get_piece(position)
  end

  def empty_cell?(position=nil,piece=nil)
    if (position != nil)
      board.empty_cell?(position)
    elsif piece != nil && piece != ""
      true
    else
      false
    end
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

  def square_clear?(to)
    piece = piece_on(to)
    empty_cell?(to) ? true : !same_color?(piece)
  end

  def same_color?(piece)
    empty_cell?(nil,piece) ? (piece.color == current_player.color) : false
  end

  def piece_on_way?(king_position,piece)
    directions_with_king(piece,king_position).any?{|d| square_empty?(d,king_position, piece)}
  end

  def directions_with_king(piece,king_position)
    piece.possible_directions.map{|d| piece.moves_from_direction(d)}.select{|d|
      d.include?(get_opponent_king.position[1,2])}
  end


  def square_empty?(square,king_position, piece)
    square.any?{|x| (x != king_position && x != piece.position[1,2] && !empty_cell?(x))}
  end

end

g = Game.new(Board.new(Array.new(8){Array.new(8,"")}), [Player.new("player1","white"), Player.new("player2","black")])
g.play
