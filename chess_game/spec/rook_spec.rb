require 'rook'

describe "Rook" do

  let(:piece) {Rook.new(:white,"a1")}
  let(:moves) {
    ["a1","a2","a3","a4","a5","a6","a7", "a8",
      "b1", "c1", "d1", "e1", "f1", "g1", "h1"]
  }

  describe '#new' do
    it "creates a new instance of the rook class" do
      expect(Rook.new(:white,"a1")).to be_instance_of Rook
    end
  end

  describe '#possible_moves' do
    it "returns a possible moves that a piece can move" do
      expect(piece.possible_moves).to eq(moves)
    end
  end
  
end
