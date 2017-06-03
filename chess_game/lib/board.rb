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

  attr_reader :squares, :rows, :columns, :en_passant_position, :en_passant_chance

  def initialize
    @rows = SIZE
    @columns = SIZE
    @bg_colors  = [:light_white, :cyan]
    @en_passant_position = {}
    @en_passant_chance = 0
    create_squares(rows,columns)
    load_pieces
  end

  def move_piece(piece,to)
    valid_move = piece.valid_move?(piece,to)
    to_empty_square = value_from(to).nil?
    can_move_piece = false
    if valid_move && to_empty_square
      if piece.type != :pawn

        if !castling_move?(piece,piece.position,to)
          can_move_piece = true
        elsif free_way_castling?(piece.position,to) && rook_can_make_castling?(to)
          rook = rook_next(to)
          new_position = rook_new_position(rook.position,to)
          fill_square(new_position,rook)
          fill_square(rook.position,nil)
          rook.position = new_position
          can_move_piece = true
        end

      elsif piece.type == :pawn && !piece.capture_moves.include?(to) && en_passant_position[piece.position].nil?

        if piece.moves == 0 && calc_distance(piece.position,to).abs == 2 && en_passant_chance == 0
          enable_en_passant_to(piece,to)
        else
          disable_en_passant(allies_from(piece))
        end
        can_move_piece = true

      elsif !en_passant_position[piece.position].nil?
        attacked_position = attacked_en_passant_position(piece.position)
        opponent_at       = en_passant_opponent(attacked_position[0][0],piece)
        can_move_piece    = capture_en_passant_piece(attacked_position, to, opponent_at)
      end

    elsif valid_move && !to_empty_square && piece.capture_moves.include?(to)
      can_move_piece = (value_from(to).color != piece.color)
    end
    
    change_piece_to(piece,piece.position,to) if can_move_piece
    can_move_piece
  end


  def free_way_castling?(from,to)
    positions_between(from,to).all?{|position| value_from(position).nil?}
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

  def change_piece_to(piece,from,to)
    piece.position = to
    piece.increment_moves
    fill_square(to,piece)
    fill_square(from,nil)
  end

  #En passant move methodos

  def capture_en_passant_piece(attacked_position,to,opponent_at)
    if attacked_position[0][0] == opponent_at[0] && to[0] == opponent_at[0]
      fill_square(opponent_at,nil)
      @en_passant_position.clear
      return true
    end
    return false
  end

  #Auxiliars Methods to capture en passant piece
  def attacked_en_passant_position(position)
    en_passant_position[position]
  end

  def en_passant_opponent(attacked_position,by_piece)
    file = (by_piece.position[0].ord + calc_displacement(attacked_position,by_piece.position))
    file.chr+by_piece.position[1]
  end

  def calc_displacement(attacked_position,piece_position)
    (attacked_position.ord - piece_position[0].ord)
  end
  #end

  def enable_en_passant_to(piece,at)
    positions = sideway_squares(at)
    opponents = extract_pieces(positions)
    if !opponents.empty?
      @en_passant_position[positions[0]] = select_en_passant_position(opponents,at)
      @en_passant_chance += 1
    end
  end

  #Auxiliars methods to enable en passant
  def sideway_squares(from)
    squares_at_side_of(from).select{|square| !value_from(square).nil?}
  end

  def extract_pieces(from_positions)
    from_positions.map{|position| value_from(position)}
  end

  def select_en_passant_position(opponents,at_side_of)
    opponents.map{|opponent| opponent.capture_moves.select{|move| move[0] == at_side_of[0]}}[0]
  end

  #End

  def disable_en_passant(to_pieces)
    to_pieces.each do |ally|
      if !en_passant_position[ally.position].nil?
        en_passant_position.clear
        @en_passant_chance = 0
      end
    end
  end

  def allies_from(piece)
    filled_squares.select{|ally| ally.color == piece.color}
  end

  #End en passant methods

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
  #End Castling Auxiliars methods

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

# system("clear")
# b = Board.new
# b.draw_board
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
