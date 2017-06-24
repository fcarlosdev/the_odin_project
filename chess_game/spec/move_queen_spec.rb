require "./lib/move_queen"
require "./lib/board_new"

describe "MoveQueen" do

  let(:board) {Board_New.new}
  let(:move_queen) {MoveQueen.new(board)}
  let(:positions) {
    {d1: "d1", d2: "d2", d4: "d4", d5: "d5", d8: "d8",
     e1: "e1", e2: "e2", f1: "f1", g1: "g1", g4: "g4",h1: "h1"}}

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

    context "when is a valid forward move" do
      it "moves the piece to the new position" do
        board.clear_square(positions[:d2])
        expect(move_queen.move(pieces[:white_queen],positions[:d4])).to eq(true)
        expect(board.value_from(positions[:d4])).to eq(pieces[:white_queen])
      end
    end

    context "when is a valid side move" do
      it "moves the piece to the new position" do
        board.clear_square(positions[:e1])
        board.clear_square(positions[:f1])
        board.clear_square(positions[:g1])
        expect(move_queen.move(pieces[:white_queen],positions[:g1])).to eq(true)
        expect(board.value_from(positions[:g1])).to eq(pieces[:white_queen])
      end
    end

    context "when is a valid diagonal move" do
      it "moves the piece to the new position" do
        board.clear_square(positions[:e2])
        expect(move_queen.move(pieces[:white_queen],positions[:g4])).to eq(true)
        expect(board.value_from(positions[:g4])).to eq(pieces[:white_queen])
      end
    end

    context "when is a valid capture move" do
      it "allows the queen to capture the opponent piece" do
        board.clear_square(positions[:e2])
        board.fill_square(positions[:g4],pieces[:black_queen])
        expect(move_queen.move(pieces[:white_queen],positions[:g4])).to eq(true)
        expect(board.value_from(positions[:g4])).to eq(pieces[:white_queen])
      end
    end

    # context "when is an invalid move" do
    #   it "doesn't allows the queen to move to the new position" do
    #     expect(move_queen.move(pieces[:white_queen],"i4")).to eq(false)
    #   end
    # end
    #
    # context "when there is a piece between the start positon and final position" do
    #   it "doesn't allows the queen to move to the new position" do
    #     expect(move_queen.move(pieces[:white_queen],"g4")).to eq(false)
    #   end
    # end

  end

end
