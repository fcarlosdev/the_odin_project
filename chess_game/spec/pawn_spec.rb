require "pawn"
require "board_new"

describe "Pawn" do

  let(:board) {Board_New.new}
  let(:piece) { Pawn.new(:white,"b2") }
  let(:moves){ ["a3", "b3", "c3", "b4"] }

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

    context "when move forward one square" do
      it "confirms that the given position is a valid move" do
        expect(piece.possible_move?("b3")).to eq(true)
      end
    end

    context "when move forward two squares on the first move" do
      it "confirms that is a valid forward move" do
        expect(piece.possible_move?("b4")).to eq(true)
      end
    end

  end

  describe '#forward_move?' do
    it "confirms that is a valid forward move" do
      expect(piece.forward_move?("b3")).to eq(true)
    end
  end

  describe '#capture_move?' do
    it "confirms that is a valid capture move" do
      expect(piece.forward_move?("b3")).to eq(true)
    end
  end

end
