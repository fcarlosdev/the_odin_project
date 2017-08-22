class ChessGame

  @@choice = 0

  def start
    while @@choice.to_i != 3 do
      welcome_screen
      play_game
    end
    end_program_actions
  end

  def welcome_screen
    system('clear')
    print %q{
      +=======================================================================+
      |                             Chess Game                                |
      | Welcome to the game, read the instructions that follow before you     |
      | start the game.                                                       |
      |   For move one piece from your location to another simply enter its   |
      | origin and destiny positions as the example shows:                    |
      |                                                                       |
      | Ex.: Move Pawn piece from F2 to F3, enter "f2", as origin and "f3" as |
      |      desinty position.                                                |
      | Obs.: Type exit or save to respectively end or save a game.           |
      +=======================================================================+
      1 - New game
      2 - Load a game
      3 - Exit Chess
    }
    print "  choose one option:"
  end

  def play_game
    @@choice = gets.chomp
    new_game.play if @@choice.to_i == 1
    if @@choice.to_i == 2
      game = load_game
      puts "Game => #{game}"
      game.change_status(:gamming)
      game.play
    end
  end

  private

  def new_game
    Game.new([Player.new("Player1",:white),Player.new("Player2",:black)])
  end

  def load_game
    if File.exists?("chess_game.yaml")
      puts "Loading game..."
      YAML::load(File.read("chess_game.yaml"))
    else
      puts "There is no saved game."
    end
  end

  def end_program_actions
    puts "Chess program finalized."
    sleep(1)
    system('exit')
  end

end
