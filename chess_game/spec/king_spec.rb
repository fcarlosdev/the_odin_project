require "king"

describe "King" do

  let(:piece) {King.new(:white,"f5")}
  let(:moves){
    ["f6","g5","f4","e5","g6","g4","e4","e6","d5","h5"]
  }

  describe '#new' do
    it "creates a new instance of the king class" do
      expect(King.new(:white,"f5")).to be_instance_of King
    end
  end

  describe '#possible_moves' do
    it "returns a possible moves that a piece can move" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

end
