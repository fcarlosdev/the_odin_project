require "./lib/queen_new"


describe "Queen_New" do

  let(:piece) {Queen_New.new(:white,"d4")}
  let(:moves){
    ["a1","a4","a7","b2","b4","b6","c3","c4","c5","d1","d2","d3","d4","d5",
      "d6","d7","d8","e3","e4","e5","f2","f4","f6","g1","g4","g7","h4","h8"]
  }
  let(:fd_moves) {["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8"]}
  let(:sd_moves) {["a4", "b4", "c4", "d4", "e4", "f4", "g4", "h4"]}
  let(:dg_moves) {["a1", "a7", "b2", "b6", "c3", "c5", "d4", "e3",
                   "e5", "f2", "f6", "g1", "g7", "h8"]}

  describe '#new' do
    it "creates a new instance of the Queen_New class" do
      expect(Queen_New.new(:white,"d4")).to be_instance_of(Queen_New)
    end
  end

  describe '#possible_move?' do
    context "when is a possible move" do
      it "indicates that is a possible move" do
        expect(piece.possible_move?(fd_moves[0])).to eq(true)
      end
    end
    context "when is an impossible move" do
      it "indicates that is an impossible move" do
        expect(piece.possible_move?("i4")).to eq(false)
      end
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that queen piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#forward_moves' do
    it "returns the possible forward moves that queen piece can do" do
      expect(piece.forward_moves).to eq(fd_moves)
    end
  end

  describe '#side_moves' do
    it "returns the possible side moves that queen piece can do" do
      expect(piece.side_moves).to eq(sd_moves)
    end
  end

  describe '#diagonal_moves' do
    it "returns the possible diagonal moves that queen piece can do" do
      expect(piece.diagonal_moves).to eq(dg_moves)
    end
  end

end
