require "./lib/piece_new"
require "./lib/forward_move"
require "./lib/diagonal_move"

class Pawn_New < Piece_New

  def initialize(color,position)
    super(:pawn,color,position)
    post_intialize
  end

  def move(to,chess_board)

    if forward_move?(to,chess_board) || capture_move?(to,chess_board)
      chess_board.move_piece(self,to)
      return true
  elsif en_passant_move?(to,chess_board)
      old_position = position
      chess_board.move_piece(self,to)
      chess_board.clear_square((to[0].concat(old_position[1])))
      return true
    end

    false
  end

  private

  def forward_move?(to,board)
    forward_moves.include?(to) && free_way?(to,board) && to_the_limit?(to)
  end

  def capture_move?(to,board)
    diagonal_moves.include?(to) && has_opponent_at?(to,board) && moved_by(to).abs == 1
  end

  def en_passant_move?(to,board)
    place = to[0].concat(position[1])
    diagonal_moves.include?(to) && has_opponent_at?(place,board) && empty_position?(to,board)
  end


  def free_way?(to,board)
    (path(to) - [position]).all?{|place| value_at(place,board).nil?}
  end

  def has_opponent_at?(position,board)
    !empty_position?(position,board) && value_at(position,board).color != color
  end

  def to_the_limit?(to)
     moved_by(to) <= max_displacement
  end

  def moved_by(to)
    calc_distance(position,to)
  end

  def forward_moves
    movements[:forward].possible_positions(position)
  end

  def diagonal_moves
    movements[:diagonal].possible_positions(position)
  end

  def post_intialize
    @movements = {forward: ForwardMove.new, diagonal: DiagonalMove.new}
  end

  def path(to)
    (color == :white) ? (position..to).to_a : (to..position).to_a.reverse
  end

  def empty_position?(at,board)
    board.empty_square?(at)
  end

  def value_at(position,board)
    board.value_from(position)
  end

  def max_displacement
    (first_move?) ? move_two_squares : move_one_square
  end

  def move_two_squares
    (color == :white) ? 2 : -2
  end

  def move_one_square
    (color == :white) ? 1 : -1
  end

end
