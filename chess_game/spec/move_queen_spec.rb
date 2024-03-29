require "./lib/move_queen"
require "./lib/board"

describe "MoveQueen" do

  let(:board) {Board.new}
  let(:move_queen) {MoveQueen.new(board)}
  let(:positions) {
    {d1: "d1", d2: "d2", d4: "d4", d5: "d5", d8: "d8",
     e1: "e1", e2: "e2", f1: "f1", g1: "g1", g4: "g4",h1: "h1"}}

  let(:pieces) {
    {white_queen: Queen.new(:white,positions[:d1]),
     white_pawn: Pawn.new(:white,positions[:d2]),
     black_queen: Queen.new(:black,positions[:d8])}
  }

  describe '#new' do
    it "creates a new instance of MoveQueen class" do
      expect(MoveQueen.new(board)).to be_instance_of(MoveQueen)
    end
  end

  describe '#move' do

    context "when is a forward move" do

      context "when is a valid move" do
        it "moves the piece to the new position" do
          board.clear_square(positions[:d2])
          expect(move_queen.move(pieces[:white_queen],positions[:d4])).to eq(true)
          expect(board.value_from(positions[:d4])).to eq(pieces[:white_queen])
        end
      end

      context "when is an invalid move" do
        it "doesn't moves the piece to the new position" do
          expect(move_queen.move(pieces[:white_queen],positions[:f2])).to eq(false)
        end
      end

      context "when there is a piece between initial and final positions" do
        it "doesn't moves the piece to the new position" do
          expect(move_queen.move(pieces[:white_queen],positions[:d4])).to eq(false)
        end
      end

    end

    context "when is a side move" do

      context "when is a valid move" do
        it "moves the piece to the new position" do
          board.clear_square(positions[:e1])
          expect(move_queen.move(pieces[:white_queen],positions[:e1])).to eq(true)
          expect(board.value_from(positions[:e1])).to eq(pieces[:white_queen])
        end
      end

      context "when is an invalid move" do
        it "doesn't moves the piece to the new position" do
          expect(move_queen.move(pieces[:white_queen],"i1")).to eq(false)
        end
      end

      context "when there is a piece between initial and final positions" do
        it "doesn't moves the piece to the new position" do
          expect(move_queen.move(pieces[:white_queen],positions[:g1])).to eq(false)
        end
      end

    end

    context "when is a diagonal move" do

      context "when is a valid move" do
        it "moves the piece to the new position" do
          board.clear_square(positions[:e2])
          expect(move_queen.move(pieces[:white_queen],positions[:e2])).to eq(true)
          expect(board.value_from(positions[:e2])).to eq(pieces[:white_queen])
        end
      end

      context "when is an invalid move" do
        it "doesn't moves the piece to the new position" do
          board.clear_square(positions[:e2])
          expect(move_queen.move(pieces[:white_queen],"i9")).to eq(false)
        end
      end

      context "when there is a piece between initial and final positions" do
        it "doesn't moves the piece to the new position" do
          expect(move_queen.move(pieces[:white_queen],positions[:f3])).to eq(false)
        end
      end

    end

    context "when is a capture move" do

      context "when there is an enemy piece at the final position" do
        it "allows the queen piece to capture the enemy piece" do
          board.clear_square(positions[:d2])
          board.fill_square(positions[:d2],pieces[:black_queen])
          expect(move_queen.move(pieces[:white_queen],positions[:d2])).to eq(true)
          expect(board.value_from(positions[:d2])).to eq(pieces[:white_queen])
        end
      end

    end

  end

end
