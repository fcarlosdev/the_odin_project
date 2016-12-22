require "./piece.rb"

describe "Piece" do

  let(:new_pos) {"Kd4"}
  let(:piece) {Piece.new(:light_white, "\u2654")}

  describe "#new" do
    it "creates a new instance of piece" do
      expect(piece).to be_instance_of(Piece)
    end
  end

  describe "#valid_move?" do
    context "when is a valid move" do
      it "returns true" do
        expect(piece.valid_move?(new_pos[1],new_pos[2])).to eq(true)
      end
    end
    context "when is an invalid move" do
      it "return false" do
        new_pos[2] = "i"
        expect(piece.valid_move?(new_pos[1],new_pos[2])).to eq(false)
      end
    end
  end

end
