require "./lib/king"

describe "King" do

  let(:piece) {King.new(:white,"d5")}
  let(:moves) {["b5","c4", "c5", "c6", "d4", "d6", "e4", "e5", "e6","f5"]}

  describe '#new' do
    it "creates a new instance of the King class" do
      expect(King.new(:white,"d5")).to be_instance_of(King)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that the king piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move?' do

    context "when is one of the possible moves of king piece" do
      it "confirms that the move is a valid move" do
        expect(piece.possible_move?("d4")).to eq(true)
      end
    end

    context "when is not one of the possible moves of king piece" do
      it "doesn't validate the move as a possible king move" do
        expect(piece.possible_move?("d3")).to eq(false)
      end

    end

  end

end
