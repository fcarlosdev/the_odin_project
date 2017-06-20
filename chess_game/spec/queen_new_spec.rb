require "./lib/queen_new"


describe "Queen_New" do

  let(:piece) {Queen_New.new(:white,"d4")}
  let(:moves){
    ["a1","a4","a7","b2","b4","b6","c3","c4","c5","d1","d2","d3","d4","d5",
      "d6","d7","d8","e3","e4","e5","f2","f4","f6","g1","g4","g7","h4","h8"]
  }

  describe '#new' do
    it "creates a new instance of the Queen_New class" do
      expect(Queen_New.new(:white,"d4")).to be_instance_of(Queen_New)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that queen piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

end
