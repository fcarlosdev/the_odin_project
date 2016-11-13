require "./game.rb"
require "./player.rb"
require "./piece.rb"

def create_pieces
  pieces = [ Piece.new(:EMPTY_DISC), Piece.new(:FILLED_DISC) ]
end

def create_players
  players = []
  pieces = create_pieces
  2.times do |i|
    print "Welcome, please enter your name: "
    name = gets.chomp
    players << Player.new(name,pieces[i])
  end
  players
end

def instructions
  puts %q{
    +------------------------------+
    |          Connect Four        |
    +------------------------------+
    | Try to put four pieces side  |
    | by side in a column, line or |
    | diagonal first than your     |
    | opponent.                    |
    | To do that drop a piece in   |
    | one column.                  |
    +------------------------------+
  }
end

instructions
players = create_players
board = Board.new(6,7)
game = Game.new(board,players)
game.current_player = game.players[0]
loop do
  system 'clear'
  game.board.show
  print "Make a move #{game.current_player.name} (Number between 0 to 6): "
  column = gets.chomp
  if ('0'..'6').include?(column) == false
    puts "please enter a valid column number"
    sleep 1
    redo
  end
  if (game.board.column_full?(column.to_i))
    puts "This column is full, please enter other number."
    sleep 1
    redo
  end

  game.fill_position(column.to_i,game.current_player.piece.symbol)

  if game.over?
    system 'clear'
    game.board.show
    puts "The #{game.current_player.name} win the game!!!"
    break
  elsif game.draw?
    game.board.show
    puts "The board is full and there is no winner."
    break
  end
  game.current_player = game.change_player
end
