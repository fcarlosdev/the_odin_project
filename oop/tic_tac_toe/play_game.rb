require './game'

system("clear")
puts "+=========================================+"
puts "|               TIC TAC TOE               |"
puts "+=========================================+"
puts "|               INSTRUCTIONS              |"
puts "| 1 - Choose a type of player (X / 0)     |"
puts "| 2 - To make move, inform the place where|"
puts "|     you want mark on the board          |"
puts "| Example: To mark the first cell of board|"
puts "|          type A0 and so on.             |"
puts "| 3 - Wait to other player make the turn  |"
puts "| 4 - Continue till there are a winner or |"
puts "|     the board is filled.                |"
puts "+-----------------------------------------+"

game = Game.new(Board.new)
game.start_game
