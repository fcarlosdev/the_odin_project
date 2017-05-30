require "./lib/piece"
require "./lib/pieces"

class Pawn < Piece

   attr_reader :en_passant_status, :capture_moves

   def initialize(color,position)
     super(:pawn,color,position)
     @image = Pieces.piece_icon(type,color)
     @capture_moves = capture_moves
   end

   def possible_moves
     generate_all_possible_moves
   end

   def capture_moves
     generate_diagonal_moves.sort
   end

   def possible_forward_moves
     generate_forward_moves
   end

   def change_en_passant_status(status)
     @en_passant_status = status
   end

   private

   def generate_all_possible_moves
     (generate_forward_moves + generate_diagonal_moves).sort
   end

   def generate_forward_moves
     generate_positions(forward_directions)
   end

   def generate_diagonal_moves
     generate_positions(diagonal_directions)
   end

   def generate_positions(directions)
     map_to_positions(new_axes_moves(directions))
   end

   def update_capture_moves
     @capture_moves = capture_moves
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
