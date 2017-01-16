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
        expect(pawn.move_to("Pa2")).to_not eq("Pa2")
      end

      it "doesn't moves two squares if isn't first move" do
        pawn.move_to("Pe3")
        pawn.move_to("Pe4")
        expect(pawn.move_to("Pe4")).to_not eq("Pe4")
      end
    end

    context "when is a valid capture move" do
      it "moves the pawn to the new positon and captures the opponent piece" do
        pawn.move_to("Pe4")
        black_pawn = Pawn.new(:black,"Pd7")
        black_pawn.move_to("Pd5")
        expect(pawn.move_to("Pd5")).to eq(black_pawn.current_position)
      end
    end

  end


end
