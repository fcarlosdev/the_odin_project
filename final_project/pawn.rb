require "./module/piece.rb"

class Pawn

  include Piece

  def initialize(color, position)
    super(color,position)
  end

  def move_to(position)
    if (super(position) && valid_move?(position))
      update_first_move if @first_move
      update_current_position(position)
      @current_pos
    end
  end

  def capture(piece)
    (in_passing_available?(piece) || in_capturable_square?(piece))
  end

  def promotion(to_other_piece)
    if [8,1].include?(@current_pos[2].to_i)
      return to_other_piece
    end
  end

  private

  def valid_move?(square)
   on_same_file?(@initial_position[1],square[1]) && square.start_with?("P") && on_limit?(square)
  end

  def on_limit?(to_position)
    moved_by = (to_position[2].to_i - @current_pos[2].to_i)
    (@first_move && moved_by <= 2) || moved_by == 1
  end

  def on_same_file?(initial_file,new_file)
    initial_file[1] == new_file[1]
  end

  def update_current_position(new_position)
    @current_pos = new_position
  end

  def in_capturable_square?(piece)
    range_xy = get_xy_range(@initial_position[2].to_i)
    get_capture_moves(range_xy).any? {|xy| xy == piece.current_pos[1..2]}
  end

  def get_xy_range(initial_position)
    xy_moves = [[-1,1], [1,1], [-1,-1], [1,-1]]
    (initial_position == 2) ? xy_moves[0..1] : xy_moves[2..3]
  end

  def get_capture_moves(xy_moves)
    possible_moves = xy_moves.collect do |xy|
      (@current_pos[1].ord + xy[0]).chr + (@current_pos[2].to_i + xy[1].to_i).to_s
    end
  end

  def in_passing_available?(piece)
    (piece.current_pos[1] == (@current_pos[1].ord - 1).chr &&
        ([-2,2].include?(piece.current_pos[2].to_i - piece.initial_position[2].to_i)))
  end

end
