require './lib/board.rb'
require './node.rb'

class KnightTravalis
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def move_knight(origin,dest)
    root = Node.new(origin)
    show_moves(knight_moves(root,dest))
  end

  def knight_moves(origin,dest)
    queue = [origin]
    until queue[0].value == dest
      possible_moves(queue[0]).each do |m|
        if !queue[0].value.include?m
          newNode = Node.new(m,queue[0])
          queue.push(newNode)
        end
      end
      queue.shift
    end
    moves = build_path(queue)
  end

  def build_path(queue)
    path = [queue[0]]
    until queue[0].parent.nil?
      path.unshift queue[0].parent
      queue[0] = queue[0].parent
    end
    path
  end

  def show_moves(path)
    squares = []
    print "You made it in #{path.length} moves! Here's your path: "
    path.each_with_index do |p,index|
      print p.value.inspect
      print " -> " if index < path.length-1
      squares << p.value
    end
    puts
    puts
    @board.draw_board(squares)
  end

  def possible_moves(node)
     moves_node = limits_move.map {|l| [node.value[0]+l[0], node.value[1]+l[1]]}
     moves_node.select {|x| x if (0..7).cover?(x[0]) && (0..7).cover?(x[1]) }
  end

  def limits_move
    return [-2,2].product([-1,1]).concat([-1,1].product([-2,2])).sort
  end

end

system('clear')
k = KnightTravalis.new
k.move_knight([0,0],[1,2])
# puts
# k.move_knight([0,0],[3,3])
# puts
# k.move_knight([3,3],[0,0])
# puts
# k.move_knight([3,3],[4,3])
# puts
# k.move_knight([0,0],[7,7])
puts
