require "./pawn.rb"

describe "Pawn" do

  let(:initial_position) {"Pf2"}
  let(:pawn) {Pawn.new(:light_white,initial_position)}

  describe "#new" do
    it "creates a new pawn piece" do
      expect(pawn).to be_instance_of(Pawn)
    end
  end

  describe "#move_to" do

    context "When is a valid move" do
      it "Moves the pawn to the new position" do
        expect(pawn.move_to("Pf3")).to eql(pawn.current_pos)
      end
    end

    context "When is an invalid move" do
      it "doesn't moves the pawn to the new position" do
        expect(pawn.move_to("Pf5")).to_not eql("Pf5")
      end
    end

    context "When move two positions and is the first move" do
      it "Moves the pawn to the new position" do
        expect(pawn.move_to("Pf4")).to eql("Pf4")
      end
    end

    context "When move two positions and is not the first move" do
      it "Doesn't moves the pawn to the new position" do
        pawn.first_move = false
        expect(pawn.move_to("Pf4")).to_not eql("Pf4")
      end
    end
  end


end
