require "./module/piece.rb"

class Rook

  include Piece

  def initialize(color, position)
    super(color,position)
  end

  def move_to(position)
    @current_pos = (super(position) && valid_move?(position)) ? position : @current_pos
  end

  private

  def valid_move?(position)
    valid  = (position[0].eql?"R")
    valid &= rook_moved_allowed?(position)
  end

  def rook_moved_allowed?(position)
    2.times.all? {|ind| position[ind+1] == @current_pos[ind+1]}
  end

end

# r = Rook.new(:light_white,"Rd5")
# puts "Color = #{r.color} Image = #{r.image}"
