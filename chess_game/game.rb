class Game

  attr_reader :players, :current_player, :board, :move_piece,
              :game_status, :status, :enemy_player

  def initialize(players)
    @players        = players
    @board          = Board.new
    @status         = :gamming
    @move_piece     = MovePiece.new(board)
    @game_status    = GameStatus.new(move_piece,board)
    @current_player ||= players[0]
    @enemy_player   ||= players[1]
  end

  def play
    loop do
      moved = take_turn
      break if game_over?
      switch_player if moved
    end
    end_of_game_actions
  end

  def change_status(status)
    @status = status
  end

  private

  def take_turn
    clear_screen
    display_board
    verify_check
    current_player_make_move
  end

  def game_over?
    @status = :checkmate if game_status.checkmate?(enemy_player)
    @status = :draw if game_status.stalemate?(enemy_player)
    [:checkmate,:draw,:exit,:save].include?(@status)
  end

  def verify_check
    if game_status.check?(current_player)
      puts "WARNING: The #{current_player.name} #{current_player.color} is in check"
    end
  end

  def current_player_make_move
    puts "Enter exit/save to respectively end or save the game."
    puts "Its your turn #{current_player.name}, your pieces are (#{current_player.color}) pieces."
    move = current_player.make_move
    if move == "exit"
      @status = :exit
      print "Save the game?(s/n): "
      save_game if gets.chomp.eql?("s")
      return false
    elsif move == "save"
      save_game
      return false
    else
      positions = move.split(",")
      if valid_enter?(positions)
        piece = board.value_from(positions[0])
        return @move_piece.move(piece,positions[1])
      else
        puts "ERROR Invalid enter! Try again."
        sleep(1)
        return false
      end
    end
  end

  def valid_enter?(values)
    return false if values.length != 2
    return false if values.any?{|value| value[0].length > 1 || value[1].length > 1}
    return false if values.any?{|value| !("a".."h").include?(value[0]) || !(1..8).include?(value[1].to_i) }
    true
  end

  def end_of_game_actions
    if [:checkmate, :draw, :exit].include?(status)
      if status != :exit
        clear_screen
        display_board
      end
      display_messages
    end
  end

  def save_game
    puts "Saving game wait..."
    sleep(1)
    game_serialized = YAML::dump(self)
    game_file = File.new("chess_game.yaml","w+")
    game_file.write(game_serialized)
    game_file.flush
    puts "Game saved."
    sleep(1)
  end

  def display_messages
    if status == :checkmate
      p "The #{current_player.name} make a checkmate move, end of the game"
    elsif status == :draw
      puts "Draw"
      p "It's a draw"
    elsif status == :exit
      p "Game finalized."
    end
  end

  def clear_screen
    system('clear')
  end

  def display_board
    board.draw_board
  end

  def switch_player
    @current_player = players.find { |player| player != current_player }
    set_enemy_player
  end

  def set_enemy_player
    @enemy_player = (current_player == players[0]) ? players[1] : players[0]
  end

end
