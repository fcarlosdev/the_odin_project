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
        expect(movePiece.move(pieces[:pawn],"a3")).to eq(true)
        expect(movePiece.move(pieces[:rook],"b5")).to eq(true)
        expect(movePiece.move(pieces[:knight],"d4")).to eq(true)
        expect(movePiece.move(pieces[:bishop],"e3")).to eq(true)
        expect(movePiece.move(pieces[:queen],"f3")).to eq(true)
        expect(movePiece.move(pieces[:king],"g3")).to eq(true)
      end
    end
  end

end
