require "./lib/piece"
# require "./lib/pawn"

describe "Piece" do

  let(:position) {"b2"}
  let(:piece) {Piece.new(:white,:pawn,position)}

  describe '#new' do
    it "creates a new instance of the piece class" do
      expect(Piece.new(:white,:pawn,position)).to be_instance_of(Piece)
    end
  end

  describe '#possible_moves' do
    it "generates the moves to the piece" do
      expect{piece.possible_moves}.to raise_error(NotImplementedError,"This #{piece.class} cannot respond to: possible_moves")
    end
  end

  describe '#valid_move?' do
    it "validates the destiny position" do
      expect{piece.valid_move?("b3",nil)}.to raise_error(NotImplementedError,"This #{piece.class} cannot respond to: valid_move?")
    end
  end

end
