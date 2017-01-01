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
    context "when is a valide move" do
      it "changes the position of the bishop" do
        expect(bishop.move_to("Bd5")).to eq(bishop.current_pos)
      end
    end
  end

end
