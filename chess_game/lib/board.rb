require "colorize"
require "./lib/piece"
require "./lib/pawn"
require "./lib/rook"
require "./lib/bishop"
require "./lib/queen"
require "./lib/knight"
require "./lib/king"
require_relative "modules/mapper"
require_relative "modules/coordenates"
require_relative "modules/distance"

class Board

  EMPTY_STRING = ""
  SIZE = 8

  include Mapper
  include Coordenates
  include Distance

  attr_reader :squares, :rows, :columns, :promotion, :en_passant_position

  def initialize
    @rows      = SIZE
    @columns   = SIZE
    @bg_colors = [:light_white, :cyan]
    @promotion = false
    @en_passant_position = []
    create_squares(rows,columns)
    load_pieces
  end

  def move_piece(piece,to)
    valid_move = piece.valid_move?(to,self)
    to_empty_square = value_from(to).nil?
    capture_move = piece.valid_capture_move?(to)
    can_move_piece = false

    if valid_move && to_empty_square

      if piece.type != :pawn

        if !castling_move?(piece,piece.position,to)
          can_move_piece = true
        elsif free_way_castling?(piece.position,to) && rook_can_make_castling?(to)

          rook = rook_next(to)
          new_position = rook_new_position(rook.position,to)
          if free_way_castling?(rook.position,to)
            fill_square(new_position,rook)
            fill_square(rook.position,nil)
            rook.position = new_position
            can_move_piece = true
          end
        end

      elsif piece.type == :pawn && [1,8].include?(to[1].to_i)

        @promotion = true
        can_move_piece = true

      elsif piece.type == :pawn && !capture_move && !en_passant_move?(piece,to)

        @en_passant_position = select_filled_squares(to).flatten if enable_en_passant?(piece,to)
        can_move_piece = true

      elsif piece.type == :pawn && capture_move && en_passant_move?(piece,to)

        opponent_at = select_filled_squares(piece.position)
        fill_square(opponent_at[0],nil)
        can_move_piece = true
        @en_passant_position.clear

      end

    elsif valid_move && !to_empty_square && capture_move

      can_move_piece = (value_from(to).color != piece.color)
      @en_passant_position.clear

    end

    if can_move_piece
      if !promotion
        change_piece_to(piece,piece.position,to)
      else
        puts "Promote the pawn to (Knight, Queen, Rook or Bishop)."
        promote_piece(piece,to)
      end
    end
    can_move_piece
  end

  def check?(attacker,king)
    attackers = pieces_of(attacker).select{|piece| piece.possible_moves.include?(king.position)}
    positions = []
    attackers.each do |piece|
      aux = piece.get_positions_with(king.position)[0]
      aux.each do |position|
        if position > piece.position && position < king.position
          positions << position
        end
      end
    end
    !attackers.empty? && positions.all?{|position| value_from(position).nil?}
  end

  def pieces_of(player)
    filled_squares.select {|piece| piece.color == player.color}
  end

  def change_piece_to(piece,from,to)
    piece.position = to
    piece.increment_moves
    fill_square(to,piece)
    fill_square(from,nil)
  end

  #En passant Auxiliars methods
  def en_passant_move?(piece,to)
    en_passant_position.include?(piece.position) && any_opponent_at_sides?(piece.position,piece)
  end

  def enable_en_passant?(piece,to)
    first_move?(piece) && moving_two_square?(piece.position,to) && any_opponent_at_sides?(to,piece)
  end

  def any_opponent_at_sides?(to,piece)
    select_filled_squares(to).any?{|square| value_from(square).color != piece.color}
  end

  def select_filled_squares(next_to)
    squares_at_side_of(next_to).select{|square| !value_from(square).nil?}
  end

  #end

  #Castling Auxiliars methods
  def castling_move?(piece,from,to)
    is_castling = king_piece?(piece)
    is_castling = is_castling && first_move?(piece)
    is_castling = is_castling && moving_throug_same_rank?(from,to)
    is_castling = is_castling && moving_two_square?(from,to)
  end

  def king_piece?(piece)
    piece.type == :king
  end

  def first_move?(piece)
    piece.moves == 0
  end

  def moving_throug_same_rank?(from,to)
    from[1] == to[1]
  end

  def moving_two_square?(from,to)
    (-2..2).cover?(calc_distance(from,to))
  end

  def free_way_castling?(from,to)
    distance = calc_distance(from,to)
    if distance <= 2
      positions_between(from,to).all?{|position| value_from(position).nil?}
    elsif distance == 3
      position = (from[0] == "a") ? ("b"+from[1]) : ("g"+from[1])
      value_from(position).nil?
    end
  end

  def positions_between(from,to)
    displacements(from,to).each_with_object([]) do |d,positions|
      new_position = (from[0].ord+d).chr + from[1]
      positions << new_position if ![from,to].include?(new_position)
    end
  end

  def displacements(from,to)
    calc_distance(from,to) == 2 ? [1,2] : [-1,-2]
  end

  def rook_can_make_castling?(to)
    rook = rook_next(to)
    !rook.nil? && rook.moves == 0
  end

  def rook_next(to)
    value_from(castling_rook_position(to))
  end

  def castling_rook_position(at)
    ((at[0] == "g") ? "h" : "a").concat(at[1])
  end

  def rook_new_position(rook_at,next_to)
    factor = (rook_at > next_to) ? -2 : 3
    (rook_at[0].ord + factor).chr.concat(rook_at[1])
  end

  #End Castling Auxiliars methods

  #Promotion
  def promote_to
    type = ""
    loop do
      print "Enter N to promote to Knight, Q to Queen, R to Rook or B to Bishop: "
      type = gets.chomp.upcase
      break if ["N","Q","R","B"].include?(type)
      system("clear")
      draw_board
    end
    type
  end

  def promote_piece(piece,at)
    type = nil
    case promote_to
    when "N"
      type = :knight
    when "Q"
      type = :queen
    when "R"
      type = :rook
    when "B"
      type = :bishop
    end
    promoved_piece = Piece.create_piece(type,piece.color,at)
    fill_square(at,promoved_piece)
    fill_square(piece.position,nil)
  end

  # Board manipulation methods

  def draw_board
    draw_squares(@bg_colors[0])
    show_bottom_letters
  end

  def value_from(position)
    square = map_to_axis(position)
    squares[square[0]][square[1]]
  end

  def fill_square(position,value)
    at_xy = map_to_axis(position)
    squares[at_xy[0]][at_xy[1]] = value
  end

  private

  def filled_squares
    squares.map{|square| square.select{|value| value if !value.nil?}}.flatten
  end
  # Methods to create  the board

  def draw_squares(bg_color)
    rows.times do |row|
      puts "".center(3) + draw_columns(bg_color)
      puts "#{rows-row}".center(3) + draw_columns(row,bg_color)
      puts "".center(3) + draw_columns(bg_color)
      bg_color = change_color(bg_color)
    end
  end

  def draw_columns(row=nil,bg_color)
    line = ""
    columns.times do |column|
      line += get_value_in(row,column).center(8).colorize(:color => :black, :background => bg_color)
      bg_color = change_color(bg_color)
    end
    line
  end

  def change_color(current_bg_color)
    [:light_white, :cyan].find {|color| color != current_bg_color}
  end

  def get_value_in(row,column)
    piece = get_square(row,column)
    (any_value_nil?([row,column]) || piece == nil) ? EMPTY_STRING : piece.image
  end

  def get_square(row,column)
    (row != nil && column != nil) ? squares[row][column] : nil
  end

  def any_value_nil?(values=[])
    values.any? {|value| value == nil}
  end

  def create_squares(row,columns)
    @squares = Array.new(rows) {Array.new(columns)}
  end

  def show_bottom_letters
    puts "".center(6)+(97.chr..(97+7).chr).to_a.join("".center(7))
  end

  def remove_nils_squares
    squares.map {|cells| cells.compact }.flatten
  end

  def load_pieces
    squares[0][0] = Piece.create_piece(:rook,:black,"a8")
    squares[0][1] = Piece.create_piece(:knight,:black,"b8")
    squares[0][2] = Piece.create_piece(:bishop,:black,"c8")
    squares[0][3] = Piece.create_piece(:queen,:black,"d8")
    squares[0][4] = Piece.create_piece(:king,:black,"e8")
    squares[0][5] = Piece.create_piece(:bishop,:black,"f8")
    squares[0][6] = Piece.create_piece(:knight,:black,"g8")
    squares[0][7] = Piece.create_piece(:rook,:black,"h8")

    squares[1][0] = Piece.create_piece(:pawn,:black,"a7")
    squares[1][1] = Piece.create_piece(:pawn,:black,"b7")
    squares[1][2] = Piece.create_piece(:pawn,:black,"c7")
    squares[1][3] = Piece.create_piece(:pawn,:black,"d7")
    squares[1][4] = Piece.create_piece(:pawn,:black,"e7")
    squares[1][5] = Piece.create_piece(:pawn,:black,"f7")
    squares[1][6] = Piece.create_piece(:pawn,:black,"g7")
    squares[1][7] = Piece.create_piece(:pawn,:black,"h7")

    squares[6][0] = Piece.create_piece(:pawn,:white,"a2")
    squares[6][1] = Piece.create_piece(:pawn,:white,"b2")
    squares[6][2] = Piece.create_piece(:pawn,:white,"c2")
    squares[6][3] = Piece.create_piece(:pawn,:white,"d2")
    squares[6][4] = Piece.create_piece(:pawn,:white,"e2")
    squares[6][5] = Piece.create_piece(:pawn,:white,"f2")
    squares[6][6] = Piece.create_piece(:pawn,:white,"g2")
    squares[6][7] = Piece.create_piece(:pawn,:white,"h2")

    squares[7][0] = Piece.create_piece(:rook,:white,"a1")
    squares[7][1] = Piece.create_piece(:knight,:white,"b1")
    squares[7][2] = Piece.create_piece(:bishop,:white,"c1")
    squares[7][3] = Piece.create_piece(:queen,:white,"d1")
    squares[7][4] = Piece.create_piece(:king,:white,"e1")
    squares[7][5] = Piece.create_piece(:bishop,:white,"f1")
    squares[7][6] = Piece.create_piece(:knight,:white,"g1")
    squares[7][7] = Piece.create_piece(:rook,:white,"h1")
  end

end

system("clear")
b = Board.new
b.draw_board
# op = "s"
# while op != "n" do
#   puts "Move a piece"
#   print "From:"
#   from = gets.chomp
#   print "To:"
#   to = gets.chomp
#   b.move_piece(b.value_from(from),to)
#   system("clear")
#   b.draw_board
#   print "Continue ? s/n :"
#   op = gets.chomp
# end

# from_to_0 = [["f2","f4"], ["a7","a5"], ["f4","f5"], ["g7","g5"], ["f5","g6"]]
# from_to_1 = [["f2","f4"], ["a7","a5"], ["f4","f5"], ["g7","g5"], ["b2","b4"], ["a5","b4"], ["f5","g6"]]
# from_to_2 = [["f2","f4"], ["a7","a5"], ["f4","f5"], ["g7","g5"], ["a2","a3"], ["d7","d5"], ["c2","c3"], ["b7","b5"], ["f5","g6"]]
# from_to_3 = [["f2","f4"], ["a7","a5"], ["f4","f5"], ["g7","g5"], ["a2","a3"], ["e7","e5"], ["f5","e6"]]
# from_to_4 = [["f2","f4"], ["a7","a5"], ["f4","f5"], ["g7","g5"], ["a2","a3"], ["e7","e5"], ["f5","g6"]]
# castling_move = [["f2","f4"],["g2","g4"],["f1","h3"],["g1","f3"],["e1","g1"]]
# all_games = []
# all_games << from_to_0
# all_games << from_to_1
# all_games << from_to_2
# all_games << from_to_3
# all_games << from_to_4
# all_games << castling_move
#
# all_games.each do |moves|
#   system("clear")
#   b = Board.new
#   b.draw_board
#   moves.each do |move|
#     puts "Moves = #{move}"
#     sleep(1)
#     if b.move_piece(b.value_from(move[0]),move[1])
#       system("clear")
#       b.draw_board
#     else
#       puts "Invalid move from #{move[0]} to #{move[1]}"
#     end
#   end
#   sleep(1)
# end
