require "./king.rb"
require "./module/piece.rb"

describe "King" do

  let(:moves) {
    {
      :d3 => "Kd3", :f3 => "Kf3", :f4 => "Kf4",
      :f5 => "Kf5", :f6 => "Kf6", :f7 => "Kf7"
    }
  }
  let(:king) {King.new(:light_white, moves[:f5])}

  describe "#new" do
    it "creates a new piece king" do
      expect(king).to be_instance_of(King)
    end
  end

  describe "#move_to" do
    context "when is a valid move" do
      it "changes the positon of the king" do
        expect(king.move_to(moves[:f6])).to eq(king.current_pos)
      end
    end
    context "when try to move more than one horizontal square" do
      it "doesn't changes the position of the king" do
        expect(king.move_to(moves[:f7])).to eq(moves[:f5])
      end
    end
    context "when try to move more than one vertical square" do
      it "doesn't changes the position of the king" do
        expect(king.move_to(moves[:f3])).to eq(moves[:f5])
      end
    end
    context "when try to move more than one diagonal square" do
      it "doesn't changes the position of the king" do
        expect(king.move_to(moves[:d3])).to eq(moves[:f5])
      end
    end
    context "When is trying the castling and is the first move" do
      it "Moves the king two square towards the rook" do
        k = King.new(king.color,"Ke1")
        expect(k.move_to("Kg1")).to eq("Kg1")
      end
    end
    context "When is trying the castling and is not the first move" do
      it "Doesn't moves the king two square towards the rook" do
        k = King.new(king.color,"Ke1")
        k.move_to("Ke2")
        expect(k.move_to("Kg1")).to_not eq("Kg1")
      end
    end
  end

end
