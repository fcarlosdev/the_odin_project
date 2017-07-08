require "./lib/rook"

describe "Rook" do

  let(:piece) {Rook.new(:white,"a1")}
  let(:moves) {
    ["a2", "a3", "a4", "a5", "a6", "a7", "a8",
     "b1", "c1", "d1", "e1", "f1", "g1", "h1"]
  }

  describe '#new' do
    it "creates a new instance of the rook class" do
      expect(Rook.new(:white,"a1")).to be_instance_of Rook
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves to the rook piece" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move?' do
    it "confirms that the position is a valid move to the rook piece" do
      expect(piece.possible_move?("a4")).to eq(true)
    end
  end

end
