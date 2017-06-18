require "./lib/piece_new"
require "./lib/forward_move"
require "./lib/diagonal_move"

class Pawn_New < Piece_New

  DIRECTIONS = { fwd: { white: [:NORTH],  black: [:SOUTH] },
                 dg:  { white: [:NE,:NW], black: [:SE,:SW]} }

  attr_reader :en_passant

  def initialize(color,position)
    super(:pawn,color,position)
    @en_passant = false
    @movements = {forward: ForwardMove.new, diagonal: DiagonalMove.new}
  end

  def possible_forward_move?(to)
    forward_moves.include?(to)
  end

  def possible_capture_move?(to)
     diagonal_moves.include?(to)
  end

  def en_passant=(new_status)
    @en_passant = new_status
  end

  private

  def forward_moves
    movements[:forward].possible_positions(position,forward_coordinates)
  end

  def forward_coordinates
    (first_move?) ? add_coordinate(coordinates(:fwd)) : coordinates(:fwd)
  end

  def add_coordinate(coordinates)
    coordinates << [coordinates[0][0]*2,coordinates[0][1]*2]
  end

  def diagonal_moves
    movements[:diagonal].possible_positions(position,coordinates(:dg))
  end

  def coordinates(type)
    get_coordinates_from(directions(type))
  end

  def directions(type)
    DIRECTIONS[type][color]
  end

end
