require './piece.rb'

class Bishop < Piece

  def possible_moves(from)
    generate_moves(from).map {|move| "B"+move}
  end

  def valid_move?(from,to)
    possible_moves(from).include?(to)
  end

  private

  def get_coordinates
    get_coordinates_from(intercardinal)
  end

  def generate_moves(from)
    @possible_directions = get_coordinates(from)
    super(from)
  end

  def get_coordinates(from)
    from_coordinates = map_to_axis(from)
    get_northwest_coordinates(from_coordinates[1]) +
    get_southeast_coordinates(from_coordinates[0]) +
    get_southwest_coordinates(from_coordinates[0]) +
    get_northeast_coordinates(from_coordinates[0])
  end


end
