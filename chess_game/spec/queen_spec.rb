require "./lib/queen"

describe "Queen" do

  let(:piece) {Queen.new(:white,"d4")}
  let(:moves){
    ["a1","a4","a7","b2","b4","b6",
     "c3","c4","c5","d1","d2","d3","d5",
     "d6","d7","d8","e3","e4","e5","f2",
     "f4","f6","g1","g4","g7","h4","h8"]}

  describe '#new' do
    it "creates a new instance of the Queen class" do
      expect(Queen.new(:white,"d4")).to be_instance_of(Queen)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves to the queen piece" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move?' do
    it "confirms that the position is a valid move to the queen piece" do
      expect(piece.possible_move?("d6")).to eq(true)
    end
  end


end
