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
        expect(pawn.move_to("Pe3")).to eql(pawn.current_pos)
      end
    end

    context "when move by two square and is the first move" do
      it "moves the pawn by two position" do
        expect(pawn.move_to("Pe4")).to eql(pawn.current_pos)
      end
    end

    context "when is invalid move" do
      it "doesn't moves the pawn to the new position" do
        current_position = pawn.move_to("Pe5")
        expect(current_position).to_not eql("Pe5")
      end
    end

    context "when move by two square and doesn't know is the first move" do
      it "doesn't moves the pawn to the new positon" do
        pawn.first_move = false
        expect(pawn.move_to("Pe4")).to_not eql("Pe4")
      end
    end

  end

  describe "#capture" do
    context "when there is an black piece on the left diagonal of the white piece" do
      it "captures the black piece on the left diagonal" do
        pawn_black = create_new_pawn("black","Pd5")
        pawn.move_to("Pe4")
        expect(pawn.capture(pawn_black)).to eq(true)
      end
    end

    context "when there is a black piece on the right diagonal of the white piece" do
      it "captures the black piece on the right diagonal" do
        pawn_black = create_new_pawn("black","Pf5")
        pawn.move_to("Pe4")
        expect(pawn.capture(pawn_black)).to eq(true)
      end
    end

    context "when there is a white piece on the left diagonal of the black piece" do
      it "captures the black piece on the left diagonal" do
        white_pawn = create_new_pawn("white","Pc4")
        black_pawn = create_new_pawn("black","Pd7")
        black_pawn.move_to("Pd5")
        expect(black_pawn.capture(white_pawn)).to eq(true)
      end
    end

    context "when there is a white piece on the right diagonal of the black piece" do
      it "captures the black piece on the right diagonal" do
        black_pawn = create_new_pawn("black","Pd7")
        black_pawn.move_to("Pd5")
        pawn.move_to("Pe4")
        expect(black_pawn.capture(pawn)).to eq(true)
      end
    end
  end
end
