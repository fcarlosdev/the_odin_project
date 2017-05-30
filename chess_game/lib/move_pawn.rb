# require "./lib/pieces"
require_relative "modules/distance"

class MovePawn

  include Distance

  attr_reader :chess_board, :to_position_value, :piece_moves, :capture_moves

  def valid_move?(piece,to,with_moves,board)
    set_chess_board(board)
    set_to_position_value(to)
    set_piece_moves(with_moves)
    set_piece_capture_moves(piece)

    valid_forward_move?(piece,to) || capture_valid_move?(piece,to)
  end


  private

  def valid_forward_move?(piece,to)
    move_one_square?(piece,to) || move_two_squares?(piece,to)
  end

  def capture_valid_move?(piece,to)
    if piece_moves.include?(to)
      return capture_moves.include?(to) && !destiny_position_empty? && opponent_piece?(piece)
    end
    false
  end

  def move_one_square?(piece,to)
    move_by_one?(piece.position,to) && piece_moves.include?(to) && destiny_position_empty?
  end

  def move_two_squares?(piece,to)
    !move_by_one?(piece.position,to) && piece.moved == 0 && destiny_position_empty?
  end

  def opponent_piece?(piece)
    to_position_value.color != piece.color
  end

  def move_by_one?(from,to)
    calc_distance(from,to).abs == 1
  end

  def destiny_position_empty?
    to_position_value == nil
  end

  def set_to_position_value(position)
    @to_position_value = @chess_board.value_from(position)
  end

  def set_chess_board(board)
    @chess_board = board
  end

  def set_piece_moves(moves)
    @piece_moves = moves
  end

  def set_piece_capture_moves(piece)
    @capture_moves = piece.capture_moves
  end


end
