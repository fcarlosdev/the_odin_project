require "./lib/rook_new"

describe "Rook_New" do

  let(:piece) {Rook_New.new(:white,"a1")}
  let(:moves) {
    ["a1","a2","a3","a4","a5","a6","a7", "a8",
      "b1", "c1", "d1", "e1", "f1", "g1", "h1"]
  }

  describe '#new' do
    it "creates a new instance of the rook class" do
      expect(Rook_New.new(:white,"a1")).to be_instance_of Rook_New
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves to the rook piece" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#forward_moves' do
    it "returns the possible forward moves to the rook piece" do
      expect(piece.forward_moves).to eq(["a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8"])
    end
  end

end
