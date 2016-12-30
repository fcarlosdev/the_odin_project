require "./king.rb"
require "./piece.rb"

describe "King" do

  let(:new_pos) {"Kd4"}
  let(:king) {King.new(:light_white)}

  def set_current_position
    king.current_pos = new_pos
  end

  describe "#new" do
    it "creates a new piece king" do
      expect(king).to be_instance_of(King)
    end
  end

  describe "#move_to" do
    context "when is a valid move" do
      it "returns true" do
        set_current_position
        expect(king.move_to(new_pos)).to eq(new_pos)
      end
    end
    context "when try to move more than one horizontal square" do
      it "return false" do
        set_current_position
        king.move_to("Kd4")
        expect(king.move_to("Kf4")).to eq("Kd4")
      end
    end
    context "when try to move more than one vertical square" do
      it "return false" do
        set_current_position
        king.move_to("Kd4")
        expect(king.move_to("Kd6")).to eq("Kd4")
      end
    end
  end

end
