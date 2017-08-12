require "./lib/king"
require "./lib/board"

describe "King" do

  let(:board) {Board.new}
  let(:white_pieces) {
    { pawn: Piece.create_piece(:pawn,:white,"a2"),
      rook: Piece.create_piece(:rook,:white,"a1"),
      bishop: Piece.create_piece(:bishop,:white,"c1"),
      queen: Piece.create_piece(:queen,:white,"d1"),
      knight: Piece.create_piece(:knight,:white,"b1"),
      king: Piece.create_piece(:king,:white,"e1")
    }
  }

  let(:black_pieces) {
    { pawn: Piece.create_piece(:pawn,:black,"a7"),
      rook: Piece.create_piece(:rook,:black,"a8"),
      bishop: Piece.create_piece(:bishop,:black,"c8"),
      queen: Piece.create_piece(:queen,:black,"d8"),
      knight: Piece.create_piece(:knight,:black,"b8"),
      king: Piece.create_piece(:king,:black,"e8")
    }
  }

  let(:moves) {["b5","c4", "c5", "c6", "d4", "d6", "e4", "e5", "e6","f5"]}

  describe '#new' do
    it "creates a new instance of the King class" do
      expect(King.new(:white,"d5")).to be_instance_of(King)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that the king piece can do" do
      white_pieces[:king].position = "d5"
      expect(white_pieces[:king].possible_moves).to eq(moves)
    end
  end

  describe '#possible_move?' do

    context "when is one of the possible moves of king piece" do
      it "confirms that the move is a valid move" do
        white_pieces[:king].position = "d5"
        expect(white_pieces[:king].possible_move?("d4")).to eq(true)
      end
    end

    context "when is not one of the possible moves of king piece" do
      it "doesn't validate the move as a possible king move" do
        expect(white_pieces[:king].possible_move?("d3")).to eq(false)
      end

    end

  end

end
