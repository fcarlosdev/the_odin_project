require "./lib/modules/distance"

class MovePiece

  include Distance
  
  attr_reader :move_pawn, :move_king,   :move_rook,
              :move_queen,:move_bishop, :move_knight,
              :moves, :board

  def initialize(board)
    @move_pawn   = MovePawn.new(board)
    @move_bishop = MoveBishop.new(board)
    @move_king   = MoveKing.new(board)
    @move_queen  = MoveQueen.new(board)
    @move_rook   = MoveRook.new(board)
    @move_knight = MoveKnight.new(board)
    @board       = board
    @moves       = set_moves
  end

  def move(piece,to)
    moves[piece.type].move(piece,to)
  end

  def free_way?(from,to)
    path = generate_path(from,to)
    inner_path = path.select{|position| ![from,to].include?(position)}
    inner_path.all?{|position| board.value_from(position) == nil}
  end

  def generate_path(from,to)
    return generate_forward_path(from,to) if forward_move?(from,to)
    return generate_side_path(from,to) if side_move?(from,to)
    return generate_diagonal_path(from,to) if diagonal_move?(from,to)
  end

  def valid_positions?(positions)
    positions.all?{|position| valid_positions.include?(position)}
  end

  def valid_moves(piece)
    piece.possible_moves.flatten.select{|move| board.empty_square?(move)}
  end

  private

  def set_moves
    { pawn:  @move_pawn,  king:   @move_king,   rook:   @move_rook,
      queen: @move_queen, bishop: @move_bishop, knight: @move_knight }
  end

  def generate_forward_path(from,to)
    (from < to) ? (from..to).to_a : (to..from).to_a
  end

  def generate_side_path(from,to)
    generate_files(from,to).map{|file| file.concat(from[1])}
  end

  def generate_diagonal_path(from,to)
    files = generate_files(from,to)
    ranks = generate_ranks(from,to)
    (!files.empty? && !ranks.empty?) ?
        (0..files.length-1).map{|index| files[index].concat(ranks[index]) } : []
  end

  def generate_files(from,to)
    (from < to) ? (from[0]..to[0]).to_a : (to[0]..from[0]).to_a
  end

  def generate_ranks(from,to)
    (from < to) ? (from[1]..to[1]).to_a : (to[1]..from[1]).to_a
  end

  def forward_move?(from,to)
    (from[0] == to[0] && from[1] != to[1])
  end

  def side_move?(from,to)
    (from[0] != to[0] && from[1] == to[1])
  end

  def diagonal_move?(from,to)
    (from[0] != to[0] && from[1] != to[1])
  end

  def empty_place?(to)
    board.empty_square?(to)
  end

  def opponent_from?(piece,at)
    !empty_place?(at) && board.value_from(at).color != piece.color
  end

  def valid_positions
    ("a1".."h8").to_a.select{|position| (1..8).include?(position[1].to_i)}
  end


end
