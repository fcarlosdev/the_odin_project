require "bishop"
require "piece"

describe "Bishop" do

  let(:piece) {Bishop.new(:white,"d5")}
  let(:moves) {
    [["e6", "f7", "g8"],       ["c6", "b7", "a8"],
     ["e4", "f3", "g2", "h1"], ["c4", "b3", "a2"]] }

  describe '#new' do
    it "creates a new instance of Bishop piece" do
      expect(Bishop.new(:white,"d5")).to be_instance_of(Bishop)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves to the bishop piece" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move?' do
    it "indicates that is a possible move" do
      expect(piece.possible_move?("c6")).to eq(true)
    end
  end

end
