require "knight"

describe "Knight" do

  let(:piece) {Knight.new(:white,"b1")}

  let(:moves){
    ["a3","c3","d2"]
  }

  describe '#new' do
    it "creates a new instance of the queen class" do
      expect(Knight.new(:white,"d4")).to be_instance_of Knight
    end
  end

  describe '#possible_moves' do
    it "returns a possible moves that a piece can move" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

end
