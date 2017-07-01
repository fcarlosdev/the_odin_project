require "./lib/knight"

describe "Knight" do

  let(:piece) {Knight.new(:white,"d4")}

  let(:moves){["b3", "b5", "c2", "c6", "e2", "e6", "f3", "f5"]}

  describe '#new' do
    it "creates a new instance of Knight class" do
      expect(Knight.new(:white,"b1")). to be_instance_of(Knight)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves to the knight piece" do
      expect(piece.possible_moves).to eq(moves)
    end
  end


end
