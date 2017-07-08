require "./lib/move_rook"
require "./lib/board"
require "./lib/rook"

describe "MoveRook" do

  let(:board) {Board.new}
  let(:move_rook) {MoveRook.new(board)}
  let(:positions) {
    {a1: "a1", a2: "a2", a3: "a3", a4: "a4",
     a5: "a5", a6: "a6", a7: "a7", a8: "a8",
     b1: "b1", b2: "b2", b3: "b3", c1: "c1",
     c2: "c2", c3: "c3", d1: "d1", d2: "d2",
     d3: "d3", e1: "e1", f1: "f1", g1: "g1",
     h1: "h1", b8: "b8", c8: "c8", d8: "d8",
     e8: "e8", f8: "f8", g8: "g8", h8: "h8"}}

  let(:pieces) {
    {white_rook: Rook.new(:white,positions[:a1]),
     white_pawn: Pawn.new(:white,positions[:a2]),
     black_rook: Rook.new(:black,positions[:a8])}
  }

  describe '#new' do
    it "create a new instance of MoveRook class" do
      expect(MoveRook.new(board)).to be_instance_of(MoveRook)
    end
  end

  describe '#move' do

    context "when is a forward move" do

      context "when is a valid move" do
        it "moves the rook piece to the new position" do
          board.clear_square(positions[:a2])
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(true)
          expect(board.value_from(positions[:a2])).to eq(pieces[:white_rook])
        end
      end

      context "when is an invalid move" do
        it "doesn't moves the rook piece to the new position" do
          expect(move_rook.move(pieces[:white_rook],positions[:b2])).to eq(false)
        end
      end

      context "when is an ally piece at the destiny position" do
        it "doesn't moves the rook piece to the new position" do
          board.fill_square(positions[:a2],pieces[:white_pawn])
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(false)
        end
      end

      context "when is a piece between initial position and end position" do
        it "doesn't moves the rook piece to the new position" do
          board.fill_square(positions[:a2],pieces[:white_pawn])
          expect(move_rook.move(pieces[:white_rook],positions[:a3])).to eq(false)
        end
      end

    end

    context "when is a side move" do

      context "when is a valid move" do
        it "moves the rook piece to the new position" do
          board.clear_square(positions[:b1])
          board.clear_square(positions[:c1])
          expect(move_rook.move(pieces[:white_rook],positions[:c1])).to eq(true)
          expect(board.value_from(positions[:c1])).to eq(pieces[:white_rook])
        end
      end

      context "when is an invalid move" do
        it "moves the rook piece to the new position" do
          expect(move_rook.move(pieces[:white_rook],"i1")).to eq(false)
        end
      end

      context "when is a piece between initial position and end position" do
        it "doesn't moves the rook piece to the new position" do
          board.fill_square(positions[:b1],pieces[:white_pawn])
          expect(move_rook.move(pieces[:white_rook],positions[:c1])).to eq(false)
        end
      end

    end

    context "when is a capture move" do

      context "when is a valid forward capture move" do
        it "moves the rook piece to the new position" do
          board.fill_square(positions[:a2],pieces[:black_rook])
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(true)
          expect(board.value_from(positions[:a2])).to eq(pieces[:white_rook])
        end
      end

      context "when is a valid side capture move" do
        it "moves the rook piece to the new position" do
          board.fill_square(positions[:b1],pieces[:black_rook])
          expect(move_rook.move(pieces[:white_rook],positions[:b1])).to eq(true)
          expect(board.value_from(positions[:b1])).to eq(pieces[:white_rook])
        end
      end

    end

  end

end
