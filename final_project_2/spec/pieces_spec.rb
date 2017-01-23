require "./pieces.rb"

describe "Pieces" do

  let(:types) {
    { king:   Pieces::King,   rook:   Pieces::Rook,   queen: Pieces::Queen,
      bishop: Pieces::Bishop, knight: Pieces::Knight, pawn:  Pieces::Pawn
    }
  }
  let(:colors) {[:light_white, :cyan]}
  let(:piece) {Pieces::King.new(colors[0],"Kf5")}

  def create_piece(type,position)
    types[type].new(colors[0],position)
  end

  describe "#new" do

    context "when is the creating of a piece of type king" do
      it "creates a new king piece" do
        expect(piece).to be_instance_of(Pieces::King)
      end
    end

    context "when is the creating of a piece of type rook " do
      it "creates a new rook piece" do
        expect(create_piece(:rook,"Rd5")).to be_instance_of(Pieces::Rook)
      end
    end

    context "when is the creating of a piece of type bishop " do
      it "creates a new bishop piece" do
        expect(create_piece(:bishop,"Bd5")).to be_instance_of(Pieces::Bishop)
      end
    end

    context "when is the creating of a piece of type queen " do
      it "creates a new queen piece" do
        expect(create_piece(:queen,"Qd4")).to be_instance_of(Pieces::Queen)
      end
    end

    context "when is the creating of a piece of type knight " do
      it "creates a new knight piece" do
        expect(create_piece(:knight,"Nd4")).to be_instance_of(Pieces::Knight)
      end
    end

    context "when is the creating of a piece of type pawn " do
      it "creates a new pawn piece" do
        expect(create_piece(:pawn,"Pf2")).to be_instance_of(Pieces::Pawn)
      end
    end

  end

  describe "#move_to" do

    context "when try to move a king piece to a valid position" do
      it "moves the king piece to the new position" do
        expect(piece.move_to("Kf6")).to eq(true)
        expect(piece.position).to eq("Kf6")
      end

    end

    context "when try to move a king piece more than one square and not castling" do
      it "doesn't moves the king piece to the new postions" do
        expect(piece.move_to("Kf7")).to eq(false)
      end
    end

    context "when try to move a rook piece to a valid position" do
      it "moves the rook piece to the new position" do
        rook = create_piece(:rook,"Rd5")
        expect(rook.move_to("Rd8")).to eq(true)
      end
    end

  end

end
