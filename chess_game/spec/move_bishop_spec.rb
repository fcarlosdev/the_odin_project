require "./lib/move_bishop"
require "./lib/board_new"

describe "MoveBishop" do

  let(:board) {Board_New.new}
  let(:move_bishop) {MoveBishop.new(board)}
  let(:positions) {
    {b2: "b2", c1: "c1", d2: "d2", e3: "e3", f4: "f4",
     g5: "g5", h6: "h6"}}

  let(:pieces) {
     {white_bishop: Bishop_New.new(:white,positions[:c1]),
      white_pawn:   Pawn_New.new(:white,positions[:c2]),
      black_bishop: Bishop_New.new(:black,positions[:c8])}
  }

  describe '#new' do
    it "create a new instance of MoveBishop class" do
      expect(MoveBishop.new(board)).to be_instance_of(MoveBishop)
    end
  end

  describe '#move' do

    context "when is a forward move" do

      before (:example) do
        board.clear_square(positions[:d2])
        board.clear_square(positions[:b2])
      end

      context "when is a valid move" do
        it "moves the bishop piece to the new position" do
          expect(move_bishop.move(pieces[:white_bishop],positions[:d2])).to eq(true)
          expect(board.value_from(positions[:d2])).to eq(pieces[:white_bishop])
        end
      end

      context "when is a move that is occupied by an ally piece" do
        it "doens't allows the bishop piece to do the move" do
          board.fill_square(positions[:d2],pieces[:white_pawn])
          expect(move_bishop.move(pieces[:white_bishop],positions[:d2])).to eq(false)
        end
      end

      context "when is a piece between the origin and destiny positions" do
        it "doesn't allows the bishop piece to do the move" do
          board.fill_square(positions[:e3],pieces[:white_pawn])
          expect(move_bishop.move(pieces[:white_bishop],positions[:f4])).to eq(false)
        end
      end

      context "when is an invalid move" do
        it "doesn't allows the bishop piece to move to the positions" do
          expect(move_bishop.move(pieces[:white_bishop],positions[:c2])).to eq(false)
        end
      end

    end

    context "when is a capture move" do

      context "when is a valid move" do
        it "allows the bishop to capture the opponent piece" do
          board.fill_square(positions[:d2],pieces[:black_bishop])
          expect(move_bishop.move(pieces[:white_bishop],positions[:d2])).to eq(true)
          # expect(board.value_from(positions[:d2])).to eq(pieces[:white_bishop])
        end
      end

    end

  end


end
