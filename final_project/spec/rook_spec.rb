require "./rook.rb"

describe "Rook" do

  let(:initial_position) {"Rd5"}
  let(:rook) {Rook.new(:light_white, initial_position)}

  describe "#new" do
    it "creates a new rook" do
      expect(rook).to be_instance_of(Rook)
    end
  end

  describe "#move_to" do

    context "When is a valid move" do
      it "changes the position of the hook" do
        expect(rook.move_to("Re5")).to eq(rook.current_position)
      end
    end

    context "When is an invalid move" do
      it "doesn't changes the position of the hook" do
        current_pos = rook.move_to("Re6")
        expect(current_pos).to_not eql("Re6")
      end
    end

  end

end
