require "./move.rb"

class MovePawn < Move

  attr_reader :capture_move

  def move(piece,from,to)
    set_piece(piece)
    (capture_move?(from,to) || (valid_move?(from,to))) ? update_squares(from,piece,to) : false
  end

  private

  def valid_move?(from,to)
     piece.valid_move?(from,to) && !capture_move && empty?(get_piece(to))
  end

  def capture_move?(from,to)
    set_capture_move(piece.capture_move?(from,to))
    capture_move && valid_capture_move?(from,to)
  end

  def valid_capture_move?(from,to)
    !empty?(get_piece(to)) && piece.possible_moves(from).include?(to)
  end

  def empty?(value)
    ["",nil].include?(value)
  end

  def update_squares(from,value_from, to)
    board.update_square(to,value_from)
    board.update_square(from,nil)
    true
  end

  def get_piece(position)
    board.get_piece(position)
  end

  def set_piece(piece)
    @piece = piece
  end

  def set_capture_move(value)
    @capture_move = value
  end


end
