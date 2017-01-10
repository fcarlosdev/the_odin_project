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
        pawn.move_to("Pf3")
        expect(pawn.move_to("Pf5")).to_not eql("Pf5")
      end
    end

    context "When is a capture opponent pice move" do
      it "Moves the pawn diagonally one square" do
        expect(pawn.move_to("Pg3")).to eql("Pg3")
      end
    end

    context "When is a invalid capture opponent piece move" do
      it "Doesn't moves pawn diagonally" do
        expect(pawn.move_to("Ph4")).to_not eql("Ph3")
      end
    end

    context "when the pawn reach the other side of the board" do
      it "Is able to be promoted to any other chess piece" do
        8.times do
          pawn.move_to(pawn.current_pos[0..1] + (pawn.current_pos[2].to_i + 1).to_s)
        end
        expect(pawn.promote_to_other_piece?(pawn.current_pos)).to eql(true)
      end
    end
  end


end
