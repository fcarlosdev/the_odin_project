require "pawn"
require "board"

describe "Pawn" do

  let(:board) {Board.new}
  let(:piece) { Pawn.new(:white,"b2") }
  let(:moves){ ["a1", "a3", "b1", "b3", "c1", "c3", "b4"] }

  describe '#new' do
    it "creates a new instance of Pawn class" do
      expect(Pawn.new(:white,"b2")).to be_instance_of(Pawn)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that the pawn piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move' do
    context "when move only one position" do
      it "confirms that the given position is a valid move" do
        expect(piece.possible_move?("b3")).to eq(true)
      end
    end

    context "when is the first move and move two positions" do
      it "confirms that the given position is a valid move" do
        expect(piece.possible_move?("b4")).to eq(true)
      end
    end
  end

end
