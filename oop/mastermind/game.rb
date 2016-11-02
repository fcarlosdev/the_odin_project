$LOAD_PATH << '.'
require 'code_generator.rb'
require 'board.rb'
require 'player.rb'
require 'colors.rb'

class MasterMind

  def initialize(generator_of_code)
    @board     = Board.new
    @generator = generator_of_code
    @players   = [Player.new("CodeBreaker"), Player.new("CodeMaker")]
    @color     = Color.new
  end

  def play_game()

    type_of_player = nil
    while !["C","M","E"].include?(type_of_player)
      system("clear")
      puts "+==================================================================+"
      puts "|                              MASTERMIND                          |"
      puts "+==================================================================+"
      puts "|                              Instructions                        |"
      puts "| 1. Choose a type of your player ( C - CodeBreaker M - CodeMaker  |"
      puts "|    E - Exit)                                                     |"
      puts "| 2. If you choose type of player CodeBreaker, the machine will go |"
      puts "|     generate a code and you have a 12 chances to guess.          |"
      puts "| 3. If you choose type of player CodeMaker, you have to generate a|"
      puts "|    new code that has contain four colors name, where the colors  |"
      puts "|    BLACK and WHITE don't must be used because they are used by   |"
      puts "|    system to generate the feedback.                              |"
      puts "|                                                                  |"
      puts "|                                  Legend                          |"
      puts "| Black - Right position and right color (Right guess)             |"
      puts "| White - Wrong position and right color                           |"
      puts "| Blank - Wrong guess                                              |"
      puts "+==================================================================+"
      print" Choose your type of player: "
      type_of_player = gets.chomp.upcase
    end
    system("clear")
    if ["C","M"].include?(type_of_player)
      type = (type_of_player == "C") ? 0 : 1
      human_player   = @players[type]
      machine_player = (human_player.type == "CodeBreaker") ? @players[1] : @players[0]
      @board.code = get_generated_code(human_player,machine_player)
      broke_code = try_break_code(human_player,machine_player)
      show_board
      puts "You broke the code!!!!!" if broke_code
      puts "Sorry, you don't broke the code. Right code: #{@board.code}" if !broke_code
    elsif type_of_player == "E"
      system("exit")
    end

  end

  private

  def try_break_code(human_player, machine_player)
    guess_number = 0
    code_broke   = false
    guess        = Array.new(4)
    feedback     = Array.new(4,"")

    while guess_number < 12 && code_broke==false

      if human_player.type == "CodeBreaker"
        guess = human_player.make_a_guess(enter_values("Enter a guess: "))
        feedback = machine_player.right_guess?(guess,@board.code)
      elsif human_player.type == "CodeMaker"
        guess = machine_player.make_a_guess(machine_player.generate_guess(@color))
        if guess_number > 0
          guess = machine_player.copy_items_right_of_last_guess_to(guess,
                @board.guesses[guess_number-1],@board.feedbacks[guess_number-1])
        end
        feedback = human_player.right_guess?(guess,@board.code)
      end
      @board.hold_guesses(guess)
      @board.hold_feedbacks(feedback)
      code_broke = feedback.all? {|value| value == "Black"}
      guess_number += 1
    end
    return code_broke
  end

  def get_generated_code(human_player, machine_player)
    if human_player.type == "CodeBreaker"
      return machine_player.generate_code(@generator)
    else
      return human_player.generate_code(enter_values("Enter a new code: "),@generator)
    end
  end

  def show_board
    @board.guesses.each_with_index do |guess,index|
      puts "Guess number: #{index}"
      puts "Guess    : #{@board.guesses[index]}"
      puts "Feedback : #{@board.feedbacks[index]}"
      puts "======================================="
    end
  end

  def enter_values(message_prompt)
    values = []
    index = 0
    show_board
    print message_prompt
    4.times do
      values[index] = gets.chomp.downcase.capitalize
      system("clear")
      show_board
      print "Values entered: " + values.inspect
      puts
      print message_prompt
      index += 1
    end
    system("clear")
    return values
  end

end


game = MasterMind.new(GeneratorOfCode.new(Color.new))
game.play_game
