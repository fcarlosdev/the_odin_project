require "./pieces.rb"

describe "Pieces" do

  let(:colors) {[:light_white, :cyan]}
  let(:pieces) {
    { king:   Pieces::King.new(colors[0],"Kf5"),
      rook:   Pieces::Rook.new(colors[0],"Rd5"),
      queen:  Pieces::Queen.new(colors[0],"Qd4"),
      bishop: Pieces::Bishop.new(colors[0],"Bd5"),
      knight: Pieces::Knight.new(colors[0],"Nd4"),
      pawn:   Pieces::Pawn.new(colors[0],"Pf2"),
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

      it "moves the king piece if the final position is valid" do
        expect(pieces[:king].move_to("Kf6")).to eq(true)
        expect(pieces[:king].position).to eq("Kf6")
      end

      context "when try to move a king piece more than one square and not is castling move" do
        it "doesn't moves the king piece to the new postions" do
          expect(pieces[:king].move_to("Kf7")).to eq(false)
        end
      end

    end

    context "when try to move a rook piece" do

      it "moves the rook piece if the final position is valid" do
        expect(pieces[:rook].move_to("Rd8")).to eq(true)
      end

      it "doesn't moves the rook piece if final position is invalid" do
        expect(pieces[:rook].move_to("Re6")).to eq(false)
      end

    end

    context "when try to move a bishop piece" do

      it "moves the bishop piece if the final position is valid" do
        expect(pieces[:bishop].move_to("Bf7")).to eq(true)
      end

      it "doesn't moves the bishop piece if the final position is invalid" do
        expect(pieces[:bishop].move_to("Bd6")).to eq(false)
      end
    end

  end

end
