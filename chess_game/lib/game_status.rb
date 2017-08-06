class GameStatus

  attr_reader :movement, :board

  def initialize(movement,board)
    @movement = movement
    @board = board
  end

  def check?(player)
    enemy_pieces_of(player).any?{|piece| piece.possible_moves.include?(get_piece(:king,player.color).position)}
  end

  def checkmate?(player)
    if check?(player)

      king = get_piece(:king,player.color)
      player_pieces = get_pieces_of(player.color)

      attackers_king = enemy_pieces_of(player).select{|piece| piece.possible_moves.include?(king.position)}
      attackers_moves = attackers_king.map{|attacker| movement.generate_path(attacker.position,king.position)}.flatten

      blockers = player_pieces.select{|piece| movement.valid_moves(piece).any?{|move| attackers_moves.include?(move)}}

      blockers.each do |blocker|

        movement.valid_moves(blocker).each do |mv|

          if attackers_moves.include?(mv)
            movement.move(blocker,mv,true)

            attackers_king.each do |attacker|

              t_path = movement.generate_path(attacker.position,king.position)
              if !t_path.nil?

                path = t_path - [attacker.position]

                if attacker.position > path[0]
                  path = path.reverse
                end

                tmp_attacker = attacker
                path.each do |pmv|
                  if !movement.move(attacker,pmv,true)
                    puts "Can't move"
                    return false
                  end
                end

              end

            end

          end

        end

      end

      return true
    end

    false

  end

  private

  def get_piece(type,color)
    board.filled_squares.select{|piece| piece.type == type && piece.color == color}[0]
  end

  def enemy_pieces_of(player)
    get_pieces_of(get_different_color_of(player))
  end

  def get_pieces_of(color)
    board.filled_squares.select{|piece| piece.color == color}
  end

  def get_different_color_of(player)
    (player.color == :white) ? :black : :white
  end

end
