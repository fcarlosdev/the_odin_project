require "./lib/move_bishop"
require "./lib/board_new"

describe "MoveBishop" do

  let(:board) {Board_New.new}
  let(:move_bishop) {MoveBishop.new(board)}
  let(:positions) {
    {b2: "b2", c1: "c1", d2: "d2", e3: "e3", f4: "f4",
     g5: "g5", h6: "h6"}}

  let(:pieces) {
     {white_bishop: Bishop.new(:white,positions[:c1]),
      white_pawn:   Pawn.new(:white,positions[:c2]),
      black_bishop: Bishop.new(:black,positions[:c8])}
  }

  describe '#new' do
    it "create a new instance of MoveBishop class" do
      expect(MoveBishop.new(board)).to be_instance_of(MoveBishop)
    end
  end

  describe '#move' do

    context "when is a valid ordinary move" do
      it "moves the bishop piece to the new positon" do
        board.clear_square(positions[:d2])
        expect(move_bishop.move(pieces[:white_bishop],positions[:e3])).to eq(true)
        expect(board.value_from(positions[:e3])).to eq(pieces[:white_bishop])
      end
    end

    context "when is a valid capture move" do
      it "allows that bishop piece captures the opponent piece" do
        board.clear_square(positions[:d2])
        board.fill_square(positions[:e3],pieces[:black_bishop])
        expect(move_bishop.move(pieces[:white_bishop],positions[:e3])).to eq(true)
        expect(board.value_from(positions[:e3])).to eq(pieces[:white_bishop])
      end
    end

    context "when is an invalid move" do
      it "doesn't allows that the bishop piece move to the new position" do
        expect(move_bishop.move(pieces[:white_bishop],"d1")).to eq(false)
      end
    end

    context "when there is a piece between the current position and final position" do
      it "doesn't allows that the bishop piece move to the new position" do
        expect(move_bishop.move(pieces[:white_bishop],positions[:e3])).to eq(false)
      end
    end

    context "when the new position has an ally piece" do
      it "doesn't allows that the bishop piece move to the new position" do
        board.fill_square(positions[:e3],pieces[:white_pawn])
        expect(move_bishop.move(pieces[:white_bishop],positions[:e3])).to eq(false)
      end
    end

  end


end
