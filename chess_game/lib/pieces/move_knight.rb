require_relative "move"

class Moveknight < Move

  def move(piece,from,to)
    if can_move?(piece,from,to)
      update_position_of(piece,from,to)
      return true
    end
    false
  end

  def can_move?(piece,from,to)
    ordinary_move?(piece,from,to) || capture_move?(piece,from,to)
  end

  private

  def ordinary_move?(piece,from,to)
    valid_move?(piece,from,to) && empty_square?(to)
  end

  def capture_move?(piece,from,to)
    valid_move?(piece,from,to) && !empty_square?(to) && opponent_of?(piece,to)
  end

  def valid_move?(piece,from,to)
    piece.valid_move?(from,to)
  end

end
