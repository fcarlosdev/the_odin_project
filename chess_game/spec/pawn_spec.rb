require "pawn"

describe "Pawn" do

  let(:position) {"b2"}
  let(:moves) { ["a3","b3","c3"] }
  let(:piece) {Pawn.new(:white,position)}

  describe '#new' do
    it "creates an instance of the pawn class" do
      expect(Pawn.new(:white,position)).to be_instance_of(Pawn)
    end
  end

  describe '#possible_moves' do
    it "generates the possible moves to the pawn" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_forward_moves' do
    it "generates the forward moves" do
      expect(piece.possible_forward_moves).to eq(["b3"])
    end
  end

  describe '#capture_moves' do
    it "generates the capture moves" do
      expect(piece.capture_moves).to eq(["a3","c3"])
    end
  end

end
