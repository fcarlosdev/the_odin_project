require "./pieces.rb"

describe "Pieces" do

  let(:colors) {[:light_white, :cyan]}
  let(:pieces) {
    { king:   Pieces::King.new(color: colors[0],position: "Kf5"),
      rook:   Pieces::Rook.new(color: colors[0],position: "Rd5"),
      bishop: Pieces::Bishop.new(color: colors[0],position: "Bd5"),
      queen:  Pieces::Queen.new(color: colors[0],position: "Qd4"),
      knight: Pieces::Knight.new(color: colors[0],position: "Nd4"),
      pawn:   Pieces::Pawn.new(color: colors[0],position: "Pf2")
    }
  }

  describe "#new" do

    context "when is the creating of a piece of type king" do
      it "creates a new king piece" do
        expect(pieces[:king]).to be_instance_of(Pieces::King)
      end
    end

    context "when is the creating of a piece of type rook " do
      it "creates a new rook piece" do
        expect(pieces[:rook]).to be_instance_of(Pieces::Rook)
      end
    end

    context "when is the creating of a piece of type bishop " do
      it "creates a new bishop piece" do
        expect(pieces[:bishop]).to be_instance_of(Pieces::Bishop)
      end
    end

    context "when is the creating of a piece of type queen " do
      it "creates a new queen piece" do
        expect(pieces[:queen]).to be_instance_of(Pieces::Queen)
      end
    end

    context "when is the creating of a piece of type knight " do
      it "creates a new knight piece" do
        expect(pieces[:knight]).to be_instance_of(Pieces::Knight)
      end
    end

    context "when is the creating of a piece of type pawn " do
      it "creates a new pawn piece" do
        expect(pieces[:pawn]).to be_instance_of(Pieces::Pawn)
      end
    end

  end

  describe "#move_to" do

    context "when try to move a king piece" do

      it "moves the king piece if the final position is possible move" do
        expect(pieces[:king].move_to("Kf6")).to eq(true)
        expect(pieces[:king].position).to eq("Kf6")
      end

      it "doesn't move the king piece if the destiny position isn't possible move" do
        expect(pieces[:king].move_to("Ka5")).to eq(false)
      end

      context "when try to move a king piece more than one square and not is castling move" do
        it "doesn't moves the king piece if try to the new postions" do
          expect(pieces[:king].move_to("Kf7")).to eq(false)
        end
      end

    end

    context "when try to move a rook piece" do

      it "moves the rook piece if the final position is valid" do
        expect(pieces[:rook].move_to("Rd8")).to eq(true)
        expect(pieces[:rook].position).to eq("Rd8")
      end

      it "doesn't moves the rook piece if final position is invalid" do
        expect(pieces[:rook].move_to("Re6")).to eq(false)
      end

    end

    context "when try to move a bishop piece" do

      it "moves the bishop piece if the final position is valid" do
        expect(pieces[:bishop].move_to("Bf7")).to eq(true)
        expect(pieces[:bishop].position).to eq("Bf7")
      end

      it "doesn't moves the bishop piece if the final position is invalid" do
        expect(pieces[:bishop].move_to("Bd6")).to eq(false)
      end
    end

    context "when try to move a queen piece" do

      it "moves the queen piece if the destiny position is valid" do
        expect(pieces[:queen].move_to("Qd8")).to eq(true)
        expect(pieces[:queen].position).to eq("Qd8")
      end

      it "doesn't moves the queen piece if the destiny position isn't possible move" do
        expect(pieces[:queen].move_to("Qf5")).to eq(false)
      end

    end

    context "when try to move a knight piece" do

      it "moves the knight piece if the destiny position is between possible moves" do
        expect(pieces[:knight].move_to("Nf5")).to eq(true)
        expect(pieces[:knight].position).to eq("Nf5")
      end

      it "doesn't moves the knight piece if the destiny position isn't possible move" do
        expect(pieces[:knight].move_to("Ne7")).to eq(false)
      end

    end

    context "when try to move a pawn piece" do

      it "moves the pawn piece if the destiny position is between possible moves" do
        expect(pieces[:pawn].move_to("Pf3")).to eq(true)
      end

      it "doesn't moves the pawn piece if the destiny position isn't possible move" do
        pieces[:pawn].move_to("Pf3")
        expect(pieces[:pawn].move_to("Ph4")).to eq(false)
      end

      it "moves the pawn piece if it is a valid capture move" do
        black_pawn = Pieces::Pawn.new(color: colors[1],position: "Pe4")
        pieces[:pawn].move_to("Pf3")
        expect(pieces[:pawn].move_to("Pe4")).to eq(true)
      end

      it "moves the pawn piece two squares if it's first move" do
        expect(pieces[:pawn].move_to("Pf4")).to eq(true)
      end
    end

  end

end
