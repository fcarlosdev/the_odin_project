require "./lib/move_king"
require "./lib/board"

describe "MoveKing" do

  let(:board) {Board.new}
  let(:move_king) {MoveKing.new(board)}
  let(:positions) {
    {d1: "d1", d2: "d2", d4: "d4", d5: "d5", d8: "d8",
     e1: "e1", e2: "e2", f1: "f1", f2: "f2", g1: "g1",
     g3: "g3", g4: "g4", h1: "h1", h4: "h4"}}

  let(:pieces) {
    {white_king: King.new(:white,positions[:e1]),
     white_pawn: Pawn.new(:white,positions[:e2]),
     black_king: King.new(:black,positions[:e8])}
  }

  describe '#new' do
    it "creates a new instance of MoveKing class" do
      expect(MoveKing.new(board)).to be_instance_of(MoveKing)
    end
  end

  describe '#move' do

    context "when is a valid forward move" do
      it "moves the piece to the new position" do
        board.clear_square(positions[:e2])
        expect(move_king.move(pieces[:white_king],positions[:e2])).to eq(true)
        expect(board.value_from(positions[:e2])).to eq(pieces[:white_king])
      end
    end

    context "when is a valid side move" do
      it "moves the piece to the new position" do
        board.clear_square(positions[:f1])
        expect(move_king.move(pieces[:white_king],positions[:f1])).to eq(true)
        expect(board.value_from(positions[:f1])).to eq(pieces[:white_king])
      end
    end

    context "when is a valid diagonal move" do
      it "moves the piece to the new position" do
        board.clear_square(positions[:f2])
        expect(move_king.move(pieces[:white_king],positions[:f2])).to eq(true)
        expect(board.value_from(positions[:f2])).to eq(pieces[:white_king])
      end
    end

    context "when is a valid capture move" do
      it "allows the king to capture the opponent piece" do
        board.fill_square(positions[:f2],pieces[:black_king])
        expect(move_king.move(pieces[:white_king],positions[:f2])).to eq(true)
        expect(board.value_from(positions[:f2])).to eq(pieces[:white_king])
      end
    end

    context "when is an invalid move" do
      it "doesn't allows the king to move to the new position" do
        expect(move_king.move(pieces[:white_king],"i4")).to eq(false)
      end
    end

    context "when is a possible castling move" do
      it "allows the king to make the casling move" do
        board.clear_square(positions[:f1])
        board.clear_square(positions[:g1])
        expect(move_king.move(pieces[:white_king],"g1")).to eq(true)
      end
    end

    context "when tha castling path move is not free" do
      it "doesn't allows the king to make the castling move" do
        expect(move_king.move(pieces[:white_king],"g1")).to eq(false)
      end
    end

  end

end
