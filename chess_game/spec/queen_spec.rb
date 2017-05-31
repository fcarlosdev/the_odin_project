require "./lib/queen"

describe "Queen" do

  let(:piece) {Queen.new(:white,"d4")}
  let(:moves){
    ["a1","a4","a7","b2","b4","b6","c3","c4","c5","d1","d2","d3","d4","d5",
      "d6","d7","d8","e3","e4","e5","f2","f4","f6","g1","g4","g7","h4","h8"]
  }

  describe '#new' do
    it "creates a new instance of the queen class" do
      expect(Queen.new(:white,"d4")).to be_instance_of Queen
    end
  end

  describe '#possible_moves' do
    it "returns a possible moves that a piece can move" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

end
