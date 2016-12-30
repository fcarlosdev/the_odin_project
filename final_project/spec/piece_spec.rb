require "./piece.rb"

describe "Piece" do

  let(:new_pos) {"Kd4"}
  let(:piece) {Piece.new(:light_white, "\u2654")}

  describe "#new" do
    it "creates a new instance of piece" do
      expect(piece).to be_instance_of(Piece)
    end
  end

  describe "#move_to" do
    context "when is a valid move" do
      it "moves the piece" do
        expect(piece.move_to(new_pos)).to eql true
      end
    end
    context "when is an invalid move" do
      it "doesn't moves the piece" do
        expect(piece.move_to("Ki6")).to eql false
      end
    end
  end

end
