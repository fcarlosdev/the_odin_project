require "./king.rb"
require "./piece.rb"

describe "King" do

  let(:king) {King.new(:light_white, "Ke5")}

  describe "#new" do
    it "creates a new piece king" do
      expect(king).to be_instance_of(King)
    end
  end

  describe "#move_to" do

    context "when it moves one valid rank" do
      it "changes the positon of the valid rank of the king" do
        expect(king.move_to("Kf6")).to eq("Kf6")
      end
    end

    context "when it moves one invalid rank" do
      it "doesn't changes the positon of the valid rank of the king" do
        king.move_to("Kf5")
        expect(king.move_to("Kh7")).to_not eq("Kh7")
      end
    end

    context "when it moves one valid file" do
      it "changes the current position to the new position" do
        expect(king.move_to("Kd5")).to eq(king.current_position)
      end
    end

    context "when it moves one invalid file" do
      it "doesn't changes the current position to the new position" do
        expect(king.move_to("Kc5")).to_not eq("Kc5")
      end
    end

    context "when it moves one valid diagonal" do
      it "changes the current position to the new diagonal square" do
        expect(king.move_to("Kf6")).to eq("Kf6")
      end
    end

    context "when it moves one invalid diagonal" do
      it "doesn't changes the current position to the new diagonal square" do
        expect(king.move_to("Kh7")).to_not eq("Kh7")
      end
    end

    context "when is the castling valid move" do
      it "moves the king two squares" do
        expect(king.move_to("Kg6")).to eq("Kg6")
      end
    end

  end

end
