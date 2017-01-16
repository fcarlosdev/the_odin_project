require "./bishop.rb"

describe "Bishop" do

  let(:initial_position) {"Bd5"}
  let(:bishop) {Bishop.new(:light_white, initial_position)}

  describe "#new" do
    it "create a new bishop" do
      expect(bishop).to be_instance_of(Bishop)
    end
  end

  describe "#move_to" do
    context "when is a valid move" do
      it "changes the position of the bishop" do
        expect(bishop.move_to("Bc6")).to eq(bishop.current_position)
      end
    end

    context "when is an invalid move" do
      it "doesn't changes the bishop to the new position" do
        current_position = bishop.move_to("Be5")
        expect(current_position).not_to eql("Be5")
      end
    end
  end

end
