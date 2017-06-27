require "./lib/bishop_new"

describe "Bishop" do

  let(:piece) {Bishop_New.new(:white,"d5")}
  let(:moves) {
    ["a2","a8","b3","b7","c4","c6", "e4","e6","f3","f7","g2","g8","h1"]
  }

  describe '#new' do
    it "creates a new instance of Bishop_New piece" do
      expect(Bishop_New.new(:white,"d5")).to be_instance_of(Bishop_New)
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
