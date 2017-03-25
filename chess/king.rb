require './piece.rb'

class King < Piece

  attr_reader :possible_directions

  def post_initialize
    @type = :king
    @image = get_image
    @possible_directions = cardinal_and_ordinal
  end

  def move(from,to)
    if (valid_move?(from,to))
      @position = to
      @first_move = false
    end
  end

  def valid_move?(from,to)
    super(from,to) && is_possible_move?(from,to) && moved_by_one_square?(from,to)
  end

  def possible_moves(from)
    map_to_positions(calcule_moves(from,get_axes_from(possible_directions)))
  end

  private

  def get_image
    {white: "\u2654", black: "\u265A"}[color.to_sym]
  end

  def is_possible_move?(from,to)
    !castling?(from,to) ? possible_moves(from).include?(to[1..2]) : true
  end

  def moved_by_one_square?(from,to)
    castling?(from,to) ? true : one_square_away?(from,to)
  end

  def castling?(from,to)
    (first_move && moved_two_files?(from,to))
  end

  def one_square_away?(from,to)
    (file_distance(from,to) <= 1 && rank_distance(from,to) <= 1)
  end

  def moved_two_files?(from,to)
    file_distance(from,to) == 2
  end

end
