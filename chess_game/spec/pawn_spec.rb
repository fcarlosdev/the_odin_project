require "./lib/pieces/pawn.rb"

describe "Pawn" do

  let(:pawn) {Pawn.new("white",:pawn)}
  let(:black_pawn) {Pawn.new("black",:pawn)}

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
      expect(pawn.possible_moves("Pa3")).to_not include("Pa2")
    end
  end

  describe '#valid_move?' do

    context "when is a valid move" do

      context "when is only a move forward one square" do
        it "validates the move when moved by one square" do
          expect(pawn.valid_move?("Pa2","Pa3")).to eq(true)
        end
      end

      context "when is a move forward two squares in the first move" do
        it "validates the move" do
          expect(pawn.valid_move?("Pa2","Pa4")).to eq(true)
          expect(black_pawn.valid_move?("Pa7","Pa5")).to eq(true)
        end
      end

    end

    context "when is an invalid move" do

      it "invalidates the move" do
        expect(pawn.valid_move?("Pa2","Pb2")).to eq(false)
      end

      it "invalidates when move by two squares and no first move" do
        pawn.update_number_of_moves
        expect(pawn.valid_move?("Pa2","Pa4")).to eq(false)
      end
    end

  end

  describe '#capture_move?' do

    context "when is a capture move" do
      it "returns true" do
        expect(pawn.capture_move?("Pa2","Pb3")).to eq(true)
      end
    end

    context "when is not a captue move" do
      it "returns false" do
        expect(pawn.capture_move?("Pa2","Pa3")).to eq(false)
      end

    end

  end

end
