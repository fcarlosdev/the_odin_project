require "./lib/move_queen"
require "./lib/board_new"

describe "MoveQueen" do

  let(:board) {Board_New.new}
  let(:move_queen) {MoveQueen.new(board)}
  let(:positions) {
    {d1: "d1", d2: "d2", d4: "d4", d5: "d5", d8: "d8",
     e1: "e1", e2: "e2", f1: "f1", g1: "g1", h1: "h1"}}

  let(:pieces) {
    {white_queen: Queen_New.new(:white,positions[:d1]),
     white_pawn: Pawn_New.new(:white,positions[:d2]),
     black_queen: Queen_New.new(:black,positions[:d8])}
  }

  describe '#new' do
    it "creates a new instance of MoveQueen class" do
      expect(MoveQueen.new(board)).to be_instance_of(MoveQueen)
    end
  end

  describe '#move' do

    context "when is a valid move" do

      context "when is a forward move" do
        it "allows that the queen piece to move to the new position" do
          board.clear_square(positions[:d2])
          expect(move_queen.move(pieces[:white_queen],positions[:d5])).to eq(true)
          expect(board.value_from(positions[:d5])).to eq(pieces[:white_queen])
        end
      end

      context "when is a side move" do
        it "allows that the queen piece to move to the new position" do
          ["e1","f1","g1","h1"].each {|place| board.clear_square(place)}
          expect(move_queen.move(pieces[:white_queen],positions[:h1])).to eq(true)
          expect(board.value_from(positions[:h1])).to eq(pieces[:white_queen])
        end
      end

      context "when is a diagonal move" do
        it "allows that the queen piece to move to the new position" do
          board.clear_square(positions[:e2])
          expect(move_queen.move(pieces[:white_queen],positions[:e2])).to eq(true)
          expect(board.value_from(positions[:e2])).to eq(pieces[:white_queen])
        end
      end

      context "when is a capture move" do
        it "allows the queen piece make the capture move" do
          board.clear_square(positions[:d2])
          board.fill_square(positions[:d5], pieces[:black_queen])
          expect(move_queen.move(pieces[:white_queen],positions[:d5])).to eq(true)
        end
      end


    #   context "when is a move to a occupied position with an ally piece" do
    #     it "doesn't the queen to move to the new position" do
    #       board.clear_square(positions[:d2])
    #       board.fill_square(positions[:d5], pieces[:white_pawn])
    #       expect(move_queen.move(pieces[:white_queen],positions[:d5])).to eq(false)
    #     end
    #   end
    #
    # end
    #
    # context "when is an invalid move" do
    #
    #   context "when is a move to a impossible position" do
    #     it "doesn't allows the queen piece to move to the new position" do
    #       expect(move_queen.move(pieces[:white_queen],"i1")).to be(false)
    #     end
    #   end
    #
    #   context "when there is a piece between the current position and final position" do
    #     it "doesn't allows the queen to move the the final position" do
    #       expect(move_queen.move(pieces[:white_queen],positions[:d5])).to eq(false)
    #     end
    #   end
    end
  end

end
