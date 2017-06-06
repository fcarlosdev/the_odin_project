require "./lib/piece"

class Pawn < Piece

   def initialize(color,position)
     super(:pawn,color,position)
   end

   def possible_moves
     (generate_forward_moves + generate_diagonal_moves).sort
   end

   def possible_forward_moves
     generate_forward_moves.sort
   end

   def capture_moves
     generate_positions(diagonal_directions).sort
   end

   def get_positions_with(final_position)
     possible_moves
   end

   private

   def generate_all_possible_moves
     (generate_forward_moves + generate_diagonal_moves).sort
   end

   def generate_forward_moves
     generated_positions = generate_positions(forward_directions)
     (moves == 0) ? add_position(generated_positions) : generated_positions
   end

   def generate_diagonal_moves
     generate_positions(diagonal_directions)
   end

   def generate_positions(directions)
     map_to_positions(new_axes_moves(directions))
   end

   def add_position(moves)
     factor = (color == :white) ? 1 : -1
     moves.push(moves.map{|move| move[0] + (move[1].to_i + factor).to_s})
     moves.flatten
   end

   def new_axes_moves(directions)
     calculate_moves(position,get_coordinates_from(directions))
   end

   def default_directions
     (color == :white) ? [:NORTH,:NE,:NW] : [:SOUTH,:SE,:SW]
   end

   def forward_directions
     (color == :white) ? [:NORTH] : [:SOUTH]
   end

   def diagonal_directions
     (color == :white) ? [:NE,:NW] : [:SE,:SW]
   end

end
