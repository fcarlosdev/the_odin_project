class Game

  attr_reader :board, :players, :current_player

  def initialize(board, players)
    @board   = board
    @players = players
    @current_player = set_current_player
  end

  def play
    from = move_piece_from
    to   = move_piece_to

    board.each do |cells|
      cells.each do |cell|
        if (cell != "" && cell.position == from)
          return PiecesUtil.position_to_axis(from)
        end
      end
    end

  end

  private

  def move_piece_from
    current_player.move_piece_from
  end

  def move_piece_to
    current_player.move_piece_to
  end

  def set_current_player
    (players[0].piece_type == :white) ? players[0] : players[1]
  end

  def change_player
    players.select {|p| p if current_player != p }
  end

end
