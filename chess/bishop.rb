require './piece.rb'

class Bishop < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "B"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_axis_directions
    get_axes_from(intercardinal)
  end

end
