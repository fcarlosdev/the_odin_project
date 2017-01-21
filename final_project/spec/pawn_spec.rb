require "./pawn.rb"

describe "Pawn" do

  let(:initial_position) {"Pe2"}
  let(:pawn) {Pawn.new(:light_white,initial_position)}

  def create_new_pawn(color,position)
    Pawn.new(color,position)
  end

  describe "#new" do
    it "creates a new pawn piece" do
      expect(pawn).to be_instance_of(Pawn)
    end
  end

  describe "#move_to" do

    context "when is a valid move" do

      it "moves the pawn to the new position" do
        expect(pawn.move_to("Pe3")).to eq(pawn.current_position)
      end

      it "moves two squares if it is the first move" do
        expect(pawn.move_to("Pe4")).to eq(pawn.current_position)
      end

    end

    context "when is an invalid move" do

      it "doesn't moves the pawn to the new position" do
        expect(pawn.move_to("Pe5")).to_not eql("Pe5")
      end

      it "doesn't moves two squares if isn't the first move" do
        pawn.move_to("Pe3")
        expect(pawn.move_to("Pe5")).to_not eql("Pe5")
      end

    end

    context "when there is a valid capture move" do

      it "moves to the left diagonal if there is an opponent piece there" do
        expect(pawn.move_to("Pd3")).to eql("Pd3")
      end

      it "moves to the right diagonal if there is an opponent piece there" do
        expect(pawn.move_to("Pf3")).to eql("Pf3")
      end

    end

    context "when is an invalid capture move" do

      it "doesn't executes the capture of the opponent piece" do
        expect(pawn.move_to("Ph4")).to_not eql("Ph4")
      end

    end

  end

end
