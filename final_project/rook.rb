require "./module/piece.rb"

class Rook

  include Piece

  def initialize(color, position)
    super(color,"", position)
  end

  def move_to(new_position)
    @current_pos = (super(new_position) && valid_move?(new_position)) ? new_position : @current_pos
  end

  private

  def valid_move?(position)
    valid  = (position[0].eql?"R")
    valid &= is_inside_limits?(position)
    valid &= moved_along_the_same_rank?(position[1])
    valid &= moved_along_the_same_file?(position[2])
  end

  def is_inside_limits?(position)
    2.times.all? {|ind| (0..7).include?(position[ind+1].ord - @current_pos[ind+1].ord)}
  end

  def moved_along_the_same_rank?(rank)
    rank == @current_pos[1]
  end

  def moved_along_the_same_file?(file)
    file == @current_pos[2]
  end

end
