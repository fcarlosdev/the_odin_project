require "./lib/piece_new"
require "./lib/forward_move"
require "./lib/diagonal_move"

class Pawn_New < Piece_New

  attr_reader :en_passant

  def initialize(color,position)
    super(:pawn,color,position)
    post_intialize
  end

  def move(to,chess_board)

    if forward_move?(to,chess_board) || capture_move?(to,chess_board)
      configure_en_passant(to,chess_board)
      chess_board.move_piece(self,to)
      return true
    elsif en_passant
      opponent_position = to[0].concat(position[1])
      chess_board.move_piece(self,to)
      chess_board.fill_square(opponent_position,nil)
      @en_passant = false
      return true
    end

    false

  end

  def en_passant=(new_status)
    @en_passant = new_status
  end

  private

  def forward_move?(to,chess_board)
    forward_positions.include?(to) && chess_board.empty_square?(to)
  end

  def capture_move?(to,chess_board)
    diagonal_positions.include?(to) && !chess_board.empty_square?(to) && opponent?(to,chess_board)
  end

  def forward_positions
    movements[:forward].possible_positions(position)
  end

  def diagonal_positions
    movements[:diagonal].possible_positions(position)
  end

  def empty_position?(to,chess_board)
    chess_board.empty_square?(to)
  end

  def opponent?(to,chess_board)
    chess_board.value_from(to).color != color
  end

  def configure_en_passant(to,board)
    if moves == 0 && calc_distance(position,to).abs == 2
      enable_en_passant(to,board)
    else
      disable_en_passant(chess_board.en_passant_pieces)
      chess_board.en_passant_pieces = []
    end
  end

  def enable_en_passant(to,board)
    opponents_next(to,board).each do |opponent|
      opponent.en_passant = true
      board.en_passant_pieces << opponent
    end
  end

  def disable_en_passant(board)
    pieces.each {|piece| piece.en_passant = false}
  end

  def opponents_next(to,board)
    pieces_next(to,board).select{|piece| opponent?(piece.position,board)}
  end

  def pieces_next(to,chess_board)
    squares_at_side_of(to).map{|position| chess_board.value_from(position)}.compact
  end

  def post_intialize
    @en_passant = false
    @movements = {forward: ForwardMove.new, diagonal: DiagonalMove.new}
  end


end
