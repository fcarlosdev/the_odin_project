require "./lib/piece"

class Pawn < Piece

  attr_reader :en_passant_ok

  def initialize(color,position)
    super(:pawn,color,position)
    @en_passant_ok = false
  end

  def move(to,chess_board)
    if possible_moves.include?(to)
      if forward_move?(position,to) && chess_board.empty_square?(to)
        chess_board.move_piece(self,to)
        side_enemies = squares_at_side_of(position).map{|square| chess_board.value_from(square)}.compact
        if moved_by(self.old_position,self.position).abs == 2
            side_enemies.compact.each do |enemy|
              enemy.en_passant_allowed(true) if enemy.type == :pawn
            end
        end
        @en_passant_ok = false
        return true
      elsif diagonal_move?(position,to) && !chess_board.empty_square?(to)
        if chess_board.value_from(to).color != color
          chess_board.move_piece(self,to)
          @en_passant_ok = false
          return true
        end
      elsif diagonal_move?(position,to) && en_passant_ok && chess_board.empty_square?(to)
        side_enemy = chess_board.value_from((to[0].concat(position[1])))
        if !side_enemy.nil?
          chess_board.move_piece(self,to)
          chess_board.clear_square(side_enemy.position)
          @en_passant_ok = false
          return true
        else
          @en_passant_ok = false
          return false
        end
      end
    end
    false
  end

  def possible_moves
    moves = generate_moves(position,default_directions,1).flatten.sort
    add_position_to(moves)
  end

  def possible_move?(to)
    possible_moves.include?(to)
  end

  def en_passant_allowed(allowed)
    @en_passant_ok = allowed
  end

  private

  def generate_moves(from,directions,number_of_moves)
    directions.map{|d| valid_positions(from,d,number_of_moves)}
  end

  def default_directions
    (color == :white) ? Directions.norwesteast : Directions.soutwesteast
  end

  def add_position_to(positions)
    position = new_position
    return (position.length > 0) ? positions.push(position) : positions
  end

  def new_position
    (first_move?) ? position[0]+(position[1].to_i + displacement_by).to_s : ""
  end

  def displacement_by
    (color == :white) ? 2 : -2
  end

end
