require "./lib/piece_new"
require "./lib/forward_move"
require "./lib/diagonal_move"

class Pawn_New < Piece_New

  def initialize(color,position,movements={})
    super(:rook,color,position,movements)
  end

  def move(to,chess_board)
    possible_moves = possible_forward_positions
    if valid_forward_move?(to) && free_way?(possible_moves,chess_board)
      chess_board.move_piece(self,to)
      return true
    elsif valid_diagonal_move?(to) && !chess_board.empty_square?(to)
      chess_board.move_piece(self,to)
      return true
    elsif valid_diagonal_move?(to) && chess_board.empty_square?(to)
      opponent_at = opponent_next_to(position,to,chess_board)
      if !opponent_at.empty?
        chess_board.move_piece(self,to)
        chess_board.fill_square(opponent_at[0],nil)
        return true
      end

    end
    false
  end

  private

  def valid_forward_move?(to)
    possible_forward_positions.include?(to)
  end

  def valid_diagonal_move?(to)
    diagonal_positions.include?(to)
  end

  def possible_forward_positions
    (moves == 0) ? add_position(forward_positions) : forward_positions
  end

  def forward_positions
    movements[:forward].get_positions(position,forward_directions,1)
  end

  def diagonal_positions
    movements[:diagonal].diagonal_positions(position,diagonal_directions,1)
  end

  def add_position(moves)
    factor = (color == :white) ? 1 : -1
    moves.push(moves.map{|move| move[0] + (move[1].to_i + factor).to_s})
    moves.flatten
  end

  def free_way?(path,chess_board)
    path.all?{|position| chess_board.empty_square?(position)}
  end

  def forward_directions
    (color == :white) ? [:NORTH] : [:SOUTH]
  end

  def diagonal_directions
    (color == :white) ? [:NE,:NW] : [:SE,:SW]
  end

  def opponent_next_to(from,to,chess_board)
    select_beside_positions(from,chess_board).select{|position| position[0] == to[0]}
  end

  def select_beside_positions(from,chess_board)
    squares_at_side_of(position).each_with_object([]) do |position,positions|
      piece = chess_board.value_from(position)
      if !piece.nil? && piece.color != color
        positions << position
      end
    end
  end

  def empty_position?(position,chess_board)
    chess_board.empty_square?(from)
  end


end
