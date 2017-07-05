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

    context "when is a foward move" do

      context "when is an empty position" do
        it "moves the piece to the new position" do
          board.clear_square(positions[:e2])
          expect(move_king.move(pieces[:white_king],positions[:e2])).to eq(true)
          expect(board.value_from(positions[:e2])).to eq(pieces[:white_king])
        end
      end

      context "when is an occupied position with an ally piece" do
        it "doesn't move the piece to the new position" do
          board.fill_square(positions[:e2],pieces[:white_pawn])
          expect(move_king.move(pieces[:white_king],positions[:e2])).to eq(false)
        end
      end

    end

    context "when is a capture move" do
      context "when there is an opponent piece at the capture position" do
        it "makes the captue move" do
          board.fill_square(positions[:e2],pieces[:black_king])
          expect(move_king.move(pieces[:white_king],positions[:e2])).to eq(true)
        end
      end
    end

    context "when is a valid castling move" do
      it "allows the king to make the castling move" do
        board.clear_square(positions[:e2])
        board.clear_square(positions[:f2])
        expect(move_king.move(pieces[:white_king],positions[:f2])).to eq(true)
      end
    end

    # context "when is a valid side move" do
    #   it "moves the piece to the new position" do
    #     board.clear_square(positions[:f1])
    #     expect(move_king.move(pieces[:white_king],positions[:f1])).to eq(true)
    #     expect(board.value_from(positions[:f1])).to eq(pieces[:white_king])
    #   end
    # end
    #
    # context "when is a valid diagonal move" do
    #   it "moves the piece to the new position" do
    #     board.clear_square(positions[:f2])
    #     expect(move_king.move(pieces[:white_king],positions[:f2])).to eq(true)
    #     expect(board.value_from(positions[:f2])).to eq(pieces[:white_king])
    #   end
    # end
    #
    # context "when is a valid capture move" do
    #
    #   context "when is a forward capture move" do
    #     it "allows the piece to capture the opponent piece" do
    #       board.fill_square(positions[:e2],pieces[:black_king])
    #       expect(move_king.move(pieces[:white_king],positions[:e2])).to eq(true)
    #       expect(board.value_from(positions[:e2])).to eq(pieces[:white_king])
    #     end
    #   end
    #
    #   context "when is a side capture move" do
    #     it "allows the piece to capture the opponent piece" do
    #       board.fill_square(positions[:f1],pieces[:black_king])
    #       expect(move_king.move(pieces[:white_king],positions[:f1])).to eq(true)
    #       expect(board.value_from(positions[:f1])).to eq(pieces[:white_king])
    #     end
    #   end
    #
    #   context "when is a diagonal capture move" do
    #     it "allows the piece to capture the opponent piece" do
    #       board.fill_square(positions[:f2],pieces[:black_king])
    #       expect(move_king.move(pieces[:white_king],positions[:f2])).to eq(true)
    #       expect(board.value_from(positions[:f2])).to eq(pieces[:white_king])
    #     end
    #   end
    #
    # end


  end

end
