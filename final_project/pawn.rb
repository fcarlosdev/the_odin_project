require "./module/piece.rb"

class Pawn

  include Piece

  attr_reader :first_move

  def initialize(color, position)
    super(color,position)
    @first_move = true
  end

  def first_move=(value)
    @first_move = value
  end

  def move_to(position)
    @current_pos = (super(position) && valid_move?(position)) ? position : @current_pos
  end

  private

  def valid_move?(position)
    position[0] == "P" && allowed_pawn_move?(position)
  end

  def allowed_pawn_move?(position)
    (position[1] == @current_pos[1]) &&
    (@first_move) ? move_ok?(position,2) : move_ok?(position,1)
  end

  def move_ok?(position, move_by)
    (position[2].to_i - @current_pos[2].to_i) <= move_by
  end

end
