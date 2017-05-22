require_relative "pieces"

class CheckmateMove

  include Pieces

  attr_reader :opponents, :board, :movements, :king_moves, :opponents_moves

  def initialize(opponents,board,movements)
    @opponents = opponents
    @board     = board
    @movements = movements
  end

  def checkmate_happened?(king)
    others_intializations(king)
    has_captured?(king) && no_escape_move?(king)
  end

  private

  def has_captured?(king)
    opponents_moves.any?{|v| board.value_from(v) == king}
  end

  def no_escape_move?(king)
    all_king_moves_in_check? && any_capture_position_with?(king)
  end

  def opponent_positions(between_pieces)
    between_pieces.map {|piece| positions_with(king_moves,piece)}.flatten.uniq
  end

  def positions_with(king_moves,opponent)
    king_moves.map {|m| opponent.get_moves_with(m,opponent.current_position)}
  end

  def all_king_moves_in_check?
    king_moves.all?{|m| opponents_moves.any?{|v| v[1..2] = m[1..2]} }
  end

  def any_capture_position_with?(king)
    group_associate_opponents_moves.all?{|piece| any_capturable_move?(piece)}
  end

  def any_capturable_move?(piece)
    prefix = piece[0].type[0].upcase
    king_moves.any?{|move| valid_move?(piece[0],(prefix+move[1..2]),movements)}
  end

  def group_associate_opponents_moves
    opponents.each_with_object({}) do |opponent, group|
      values = opponents_moves.select{|position| position.start_with?(opponent.type[0].upcase)}
      group[opponent] = values if !values.empty?
    end
  end

  def others_intializations(king)
    @king_moves      = valid_moves(king,movements)
    @opponents_moves = opponent_positions(opponents)
  end

end
