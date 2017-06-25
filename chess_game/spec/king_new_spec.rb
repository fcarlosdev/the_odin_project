require "./lib/king_new"

describe "King_New" do

  let(:piece) {King_New.new(:white,"d5")}
  let(:moves) {["c4", "c5", "c6", "d4", "d5", "d6", "e4", "e5", "e6"]}

  describe '#new' do
    it "creates a new instance of the King_New class" do
      expect(King_New.new(:white,"d5")).to be_instance_of(King_New)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that the king piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move?' do
    it "returns the possible moves that the king piece can do" do
      expect(piece.possible_move?("c6")).to eq(true)
    end
  end

end
