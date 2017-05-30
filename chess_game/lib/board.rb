require "colorize"
require_relative "pieces/pieces"
require_relative "pieces/mapper"

class Board

  include Pieces
  include Mapper

  EMPTY_STRING = ""

  attr_reader :squares, :rows, :columns, :opponents, :moves

  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    @bg_colors  = [:light_white, :cyan]
    @opponents = []
    create_squares(rows,columns)
    load_pieces
  end

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

  def position_from(piece_type, from_color)
    piece_found = remove_nils_squares.select {|piece| piece.type == piece_type && piece.color == from_color}
    piece_found[0].current_position if piece_found.length > 0
  end

  def game_over?(king,movements)
    @opponents = opponents_from(king,board_pieces)
    @moves = moves = opponents_moves(king.current_position)
    return "checkmate" if checkmate?(king,movements)
    return "draw" if draw?(king,movements)
    return "playing"
  end

  def board_pieces
    squares.each_with_object([]) do |rows, values|
      rows.each do |piece|
        values << piece if piece != nil
      end
    end
  end

  def check?(king,movements)
    set_opponents_from(king) if opponents.empty?
    king_at = king.current_position
    # if moves.empty?
    #   puts "Going generate moves"
    #   @moves = opponents_moves(king_at)
    # end
    v_moves = []
    puts "#{king.color} at #{king_at}"
    moves.each do |op|
      piece = op[0]
      moves = op[1]
      # puts "Opponent #{piece.type} at #{piece.current_position} with #{moves}"
      values = ""
      values = "#{piece.type} => "
      mvs = ""
      vld_moves = []
      moves.each do |move|
        puts "it'll validate the path => #{moves} to #{piece.type} at #{piece.current_position}"
        vld_moves << valid_move?(piece,move,movements)
        puts "Finalize validate of the path => #{moves} to #{piece.type} at #{piece.current_position}"
        mvs += "(#{move})"
        vl = value_from(move)
        txtv = (vl != nil) ? "#{value_from(move)}" : "empty"
        if moves.last != move
          mvs += "= #{txtv} ->"
        else
          mvs += "= #{txtv}"
        end
      end
      values += mvs + " valid path #{vld_moves}"
      # puts values
      puts " "
      puts " "
      v_moves << vld_moves
      if v_moves.any?{|moves| moves.all?{|move| move == true}}
        puts "has to break HERE"
        return true
      end
    end
    any_valid_path = v_moves.any?{|moves| moves.all?{|move| move == true}}
    attacked = moves.any?{|move| move[1..2] == king_at[1..2]}
    # any_valid_path = valid_path_to_king(moves,movements)
    # attacked = moves.any?{|move| move[1].any?{|position| position[1..2] == king_at[1..2]}}
    any_valid_path && attacked
  end

  def valid_path_to_king(path_moves,movements)
    v_moves = []
    path_moves.each do |op|
      piece = op[0]
      positions = op[1]
      vld_moves = []
      positions.each do |move|
        vld_moves << valid_move?(piece,move,movements)
      end
      v_moves << vld_moves
    end
    # puts "Moves #{v_moves}"
    v_moves.any?{|positions| positions.all?{|move| move == true}}
  end

  def checkmate?(king,movements)
    no_move = no_valid_move?(king,movements)
    # in_check = check?(king,movements)
    # puts "No move = #{no_move.inspect} and in check = #{in_check}"
    # puts
    # check?(king,movements) && no_valid_move?(king,movements)
    check?(king,movements)
  end

  def draw?(king,movements)
    no_move = no_valid_move?(king,movements)
    # not_check = !check?(king,movements)
    # puts "No move = #{no_move.inspect} and not in check = #{not_check}"
    # puts
    !check?(king,movements)
    # !check?(king,movements) && no_valid_move?(king,movements)
  end

  def no_valid_move?(king,movements)
    @moves = opponents_moves(king.current_position)
    allies = allies_from(king,board_pieces)
    # puts "Number of allies pieces = #{allies.length}"
    allies.each do |ally|
      moves = valid_moves(ally,movements)
      puts "#{ally.type} with moves #{moves}"
      from = ally.current_position
      moves.each do |move|
        piece_at = value_from(move)
        # puts "Piece at = #{piece_at}"
        tmp_move(ally,move)
        no_cause_check = !check?(king,movements)
        puts "Move #{ally.type} from #{from} to #{move} no cause check? #{no_cause_check}"
        tmp_move(ally,from)
        if piece_at != nil
          puts "Undo move to piece #{piece_at}"
          tmp_move(piece_at,move)
        end
      end
    end
    # allies_moves = allies.each_with_object({}) do |ally,moves|
    #   tmp_moves = valid_moves(ally,movements)
    #   moves[ally] = tmp_moves if !tmp_moves.empty?
    # end
    #
    # all_moves_valid = []
    # allies_moves.each do |ally_move|
    #   ally = ally_move[0]
    #   moves = ally_move[1]
    #   moves_valid = []
    #   # puts "#{ally.type} at #{ally.current_position} with #{moves} moves"
    #   old_position = ally.current_position
    #   moves.each do |move|
    #     tmp_move(ally,move)
    #     moves_valid << check?(king,movements)
    #     tmp_move(ally,old_position)
    #   end
    #   all_moves_valid << moves_valid
    #   break if all_moves_valid.any?{|moves| moves.all?{|move| move == true}} || all_moves_valid.empty?
    # end
    # puts "Valid moves = #{all_moves_valid.flatten}"
    # result = all_moves_valid.any?{|moves| moves.all?{|move| move == true}} || all_moves_valid.empty?
    # puts "Result = #{result}"
    # result
  end

  def set_opponents_from(piece)
    @opponents = opponents_from(piece,board_pieces)
  end

  private

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
    squares[0][0] = create_piece(:rook,   "black", "Ra8")
    squares[0][1] = create_piece(:knight, "black", "Nb8")
    squares[0][2] = create_piece(:bishop, "black", "Bc8")
    squares[0][3] = create_piece(:queen,  "black", "Qd8")
    squares[0][4] = create_piece(:king,   "black", "Ke8")
    squares[0][5] = create_piece(:bishop, "black", "Bf8")
    squares[0][6] = create_piece(:knight, "black", "Ng8")
    squares[0][7] = create_piece(:rook,   "black", "Rh8")

    squares[1][0] = create_piece(:pawn,"black","Pa7")
    squares[1][1] = create_piece(:pawn,"black","Pb7")
    squares[1][2] = create_piece(:pawn,"black","Pc7")
    squares[1][3] = create_piece(:pawn,"black","Pd7")
    squares[1][4] = create_piece(:pawn,"black","Pe7")
    squares[1][5] = create_piece(:pawn,"black","Pf7")
    squares[1][6] = create_piece(:pawn,"black","Pg7")
    squares[1][7] = create_piece(:pawn,"black","Ph7")

    squares[6][0] = create_piece(:pawn,"white","Pa2")
    squares[6][1] = create_piece(:pawn,"white","Pb2")
    squares[6][2] = create_piece(:pawn,"white","Pc2")
    squares[6][3] = create_piece(:pawn,"white","Pd2")
    squares[6][4] = create_piece(:pawn,"white","Pe2")
    squares[6][5] = create_piece(:pawn,"white","Pf2")
    squares[6][6] = create_piece(:pawn,"white","Pg2")
    squares[6][7] = create_piece(:pawn,"white","Ph2")

    squares[7][0] = create_piece(:rook,  "white" ,"Ra1")
    squares[7][1] = create_piece(:knight,"white" ,"Nb1")
    squares[7][2] = create_piece(:bishop,"white" ,"Bc1")
    squares[7][3] = create_piece(:queen, "white" ,"Qd1")
    squares[7][4] = create_piece(:king,  "white" ,"Ke1")
    squares[7][5] = create_piece(:bishop,"white" ,"Bf1")
    squares[7][6] = create_piece(:knight,"white" ,"Ng1")
    squares[7][7] = create_piece(:rook,  "white" ,"Rh1")
  end

  def tmp_move(piece,to)
    if (piece != nil)
      fill_square(to,piece)
      piece.current_position = to
    end
  end

  def opponents_moves(king_at)
    opponents.each_with_object({}) do |opponent,moves|
      tmp_moves = opponent.get_moves_with(king_at,opponent.current_position).flatten
      moves[opponent] = sort_positions(tmp_moves,opponent.current_position,king_at) if !tmp_moves.empty?
    end
  end

  def sort_positions(positions,from,to)
    range = (from[1..2] < to[1..2]) ? (from[1..2]..to[1..2]) : (to[1..2]..from[1..2])
    positions.select{|move| range.include?(move[1..2])}
  end


end
