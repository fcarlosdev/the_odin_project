require './lib/move_piece'
require './lib/board'
require './lib/piece'

describe "MovePiece" do

  let(:board) {Board.new}
  let(:movePiece) {MovePiece.new(board)}
  let(:pieces) {
    {pawn: Piece.create_piece(:pawn,:white,"a2"),
     rook: Piece.create_piece(:rook,:white,"b2"),
     knight: Piece.create_piece(:knight,:white,"c2"),
     bishop: Piece.create_piece(:bishop,:white,"d2"),
     queen: Piece.create_piece(:queen,:white,"e2"),
     king: Piece.create_piece(:king,:white,"f2")}
  }

  describe '#new' do
    it "creates a new instance of MovePiece class" do
      expect(MovePiece.new(board)).to be_instance_of(MovePiece)
    end
  end

  describe '#move' do

    context "when is a valid move" do
      it "moves a given piece to the given position" do
        # expect(movePiece.move(pieces[:pawn],"a3")).to eq(true)
        # expect(movePiece.move(pieces[:rook],"b5")).to eq(true)
        # expect(movePiece.move(pieces[:knight],"d4")).to eq(true)
        # expect(movePiece.move(pieces[:bishop],"e3")).to eq(true)
        # expect(movePiece.move(pieces[:queen],"f3")).to eq(true)
        expect(movePiece.move(pieces[:king],"g3")).to eq(true)
      end
    end
  end

  describe '#free_way?' do
    context "when there is no piece between origin and destiny" do
      it "confirms the way is free" do
        board.clear_square("a2")
        expect(movePiece.free_way?("a1","a3")).to eq(true)
      end
    end
  end

  describe '#generate_path' do
    it "generates the path between two positions" do
      expect(movePiece.generate_path("a1","a3")).to eq(["a1","a2","a3"])
      expect(movePiece.generate_path("a3","a1")).to eq(["a1","a2","a3"])
      expect(movePiece.generate_path("a1","c1")).to eq(["a1","b1","c1"])
      expect(movePiece.generate_path("c1","a1")).to eq(["a1","b1","c1"])
      expect(movePiece.generate_path("a1","a7")).to eq(["a1","a2","a3","a4","a5","a6","a7"])
      expect(movePiece.generate_path("a1","c3")).to eq(["a1","b2","c3"])
      expect(movePiece.generate_path("c3","a1")).to eq(["a1","b2","c3"])
      expect(movePiece.generate_path("h8","f6")).to eq(["f6","g7","h8"])
      expect(movePiece.generate_path("f6","h8")).to eq(["f6","g7","h8"])
      expect(movePiece.generate_path("a1","g1")).to eq(["a1","b1","c1","d1","e1","f1","g1"])
      expect(movePiece.generate_path("a1","g7")).to eq(["a1","b2","c3","d4","e5","f6","g7"])
      expect(movePiece.generate_path("h8","b2")).to eq(["b2","c3","d4","e5","f6","g7","h8"])
    end
  end

end
