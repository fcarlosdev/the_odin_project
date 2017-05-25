require_relative "lib/game"
system('clear')
print %q{
  +=======================================================================+
  |                             Chess Game                                |
  | Welcome to the game, read the instructions that follow before you     |
  | start the game.                                                       |
  |   For move one piece from your location to another simply enter its   |
  | origin and destiny positions as the example shows:                    |
  |                                                                       |
  | Ex.: Move Pawn piece from F2 to F3, enter "Pf2", as origin and "Pf3"  |
  |      as desinty position.                                             |
  |                                                                       |
  |      Where "P", identify the type of the piece,in this case Pawn, the |
  | "a" indicates the file/column where pawn is actually positioned and   |
  | "2" indicates the rank/line where pawn is actually positioned.        |
  +=======================================================================+
  1 - New game
  2 - Load a game
  3 - Exit
}
print "choose one option:"

option = gets.chomp

case option.to_i
when 1
  g = Game.new([Player.new("Francisco","white"), Player.new("Luisa","black")])
  g.play
when 2
  puts "Not implemented yet"
when 3
  exit
else
  print('It is not a valid option')
end
