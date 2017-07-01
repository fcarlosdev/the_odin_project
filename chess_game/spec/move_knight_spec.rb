require "./lib/move_knight"
require "./lib/board_new"
require "./lib/knight"

describe "MoveKnight" do

  let(:board) {Board_New.new}
  let(:move_knight) {MoveKnight.new(board)}

  let(:positions) {
    {a3: "a3", b1: "b1", b8: "b8", c3: "c3"}}

  let(:pieces) {
    {white_knight: Knight.new(:white,positions[:b1]),
     white_pawn:   Pawn.new(:white,positions[:b2]),
     black_knight: Knight.new(:black,positions[:b8])}
  }

  describe '#new' do
    it "creates a new instance of MoveKnight class" do
      expect(MoveKnight.new(board)).to be_instance_of(MoveKnight)
    end
  end

  describe '#move' do

    context "when is a valid move" do
      it "allows the knight piece to move the the new place" do
        expect(move_knight.move(pieces[:white_knight],positions[:c3])).to eq(true)
        expect(board.value_from(positions[:c3])).to eq(pieces[:white_knight])
      end
    end

    context "when is a move to filled place by an ally piece" do
      it "doesn't the knight piece to move the the new place" do
        board.fill_square(positions[:c3],pieces[:white_pawn])
        expect(move_knight.move(pieces[:white_knight],positions[:c3])).to eq(false)
      end
    end
    context "when is a move to filled place by an enemy piece" do
      it "allows the knight piece to move the the new place" do
        board.fill_square(positions[:c3],pieces[:black_knight])
        expect(move_knight.move(pieces[:white_knight],positions[:c3])).to eq(true)
        expect(board.value_from(positions[:c3])).to eq(pieces[:white_knight])
      end
    end

  end


end
