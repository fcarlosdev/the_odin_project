require "./piece.rb"

describe "Piece" do

  let(:piece) {Piece.new(:light_white,"Pb2")}

  describe "#new" do
    it "create a new piece of choosen type" do
      expect(piece).to be_instance_of(Piece)
    end
  end

  describe "#move_to" do

    context "when is a valid move" do
      it "Moves the piece to new position" do
        expect(piece.move_to("Pb3")).to eql(piece.current_position)
      end
    end

    context "when is an invalid move" do
      it "Doesn't moves the piece to new position" do
        new_position = "Pb9"
        expect(piece.move_to(new_position)).to_not eql("Pb9")
      end
    end
  end
end
