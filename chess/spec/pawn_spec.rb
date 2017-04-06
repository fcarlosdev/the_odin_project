require "./pawn.rb"

describe "Pawn" do

  let(:pawn) {Pawn.new("white",:pawn,"\u2659")}

  describe '#new' do
    it "creates a new intance of the pawn piece" do
      expect(pawn).to be_instance_of(Pawn)
      expect(pawn.color).to eq("white")
      expect(pawn.type).to eq(:pawn)
      expect(pawn.image).to eq("♙")
    end
  end

  describe '#possible_moves' do
    it "calculates the possible moves from given initial positon" do
      expect(pawn.possible_moves("Pa2")).to_not be_nil
      expect(pawn.possible_moves("Pa2")).to include("Pa3")
    end
  end

  describe '#valid_move?' do

    context "when is a valid move?" do
      it "validates the move when moved by one square" do
        expect(pawn.valid_move?("Pa2","Pa3")).to eq(true)
      end

      it "validates the move by two square when is the first move" do
       expect(pawn.valid_move?("Pa2","Pa4")).to eq(true)
       expect(pawn.valid_move?("Pa7","Pa5")).to eq(true)
      end

    end

    context "when is an invalid move" do

      it "invalidates the move" do
        expect(pawn.valid_move?("Pa2","Pb2")).to eq(false)
      end

      it "invalidates when move by two squares and no first move" do
        allow(pawn).to receive(:first_move).and_return(false)
        expect(pawn.valid_move?("Pa2","Pa4")).to eq(false)
      end
    end

  end

end
