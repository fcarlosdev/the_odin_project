require "./piece.rb"

class King < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "K"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_axis_directions
    get_axes_from(cardinal_and_ordinal)
  end


end
