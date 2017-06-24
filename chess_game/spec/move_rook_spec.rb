require "./lib/move_rook"
require "./lib/board_new"
require "./lib/rook_new"

describe "MoveRook" do

  let(:board) {Board_New.new}
  let(:move_rook) {MoveRook.new(board)}
  let(:positions) {
    {a1: "a1", a2: "a2", a3: "a3", a4: "a4",
     a5: "a5", a6: "a6", a7: "a7", a8: "a8",
     b1: "b1", c1: "c1", d1: "d1", d2: "d2",
     d3: "d3", e1: "e1", f1: "f1", g1: "g1",
     h1: "h1", b8: "b8", c8: "c8", d8: "d8",
     e8: "e8", f8: "f8", g8: "g8", h8: "h8"}}

  let(:pieces) {
    {white_rook: Rook_New.new(:white,positions[:a1]),
     white_pawn: Pawn_New.new(:white,positions[:a2]),
     black_rook: Rook_New.new(:black,positions[:a8])}
  }

  describe '#new' do
    it "create a new instance of MoveRook class" do
      expect(MoveRook.new(board)).to be_instance_of(MoveRook)
    end
  end

  describe '#move' do

    context "when is a forward move" do

      context "when is a valid forward move" do
        it "moves the rook piece to the new position" do
          board.clear_square(positions[:a2])
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(true)
          expect(board.value_from(positions[:a2])).to eq(pieces[:white_rook])
        end
      end

      context "when is a valid side move" do
        it "moves the rook piece to the new position" do
          board.clear_square(positions[:b1])
          board.clear_square(positions[:c1])
          board.clear_square(positions[:d1])
          expect(move_rook.move(pieces[:white_rook],positions[:d1])).to eq(true)
          expect(board.value_from(positions[:d1])).to eq(pieces[:white_rook])
        end
      end

      context "when is a valid capture move" do
        it "allows the rook piece to capture the opponent piece" do
          board.clear_square(positions[:b1])
          board.clear_square(positions[:c1])
          board.fill_square(positions[:d1],pieces[:black_rook])
          expect(move_rook.move(pieces[:white_rook],positions[:d1])).to eq(true)
          expect(board.value_from(positions[:d1])).to eq(pieces[:white_rook])
        end
      end

      context "when is an invalid move" do
        it "doesn't allows the movement" do
          expect(move_rook.move(pieces[:white_rook],positions[:d3])).to eq(false)
        end
      end

      context "when there is a piece between the current position and final position" do
        it "doesn't allows the movement" do
          expect(move_rook.move(pieces[:white_rook],positions[:a3])).to eq(false)
        end
      end

    end

  end

end
