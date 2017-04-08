require "./rook.rb"

describe "Rook" do

  let(:rook) {Rook.new("white",:rook)}

  describe '#new' do
    it "creates new instance of the rook piece" do
      expect(rook).to be_instance_of(Rook)
      expect(rook.color).to eq("white")
      expect(rook.type).to eq(:rook)
      expect(rook.image).to eq("♖")
    end
  end

  describe '#possible_moves' do

    context "when the moves is to the north direction" do
      it "calculates the north possible positions" do
        expect(rook.possible_moves("Rd5")).to include("Rd7")
      end
    end

    context "when the moves is to the south direction" do
      it "calculates the south possible positions" do
        expect(rook.possible_moves("Rd5")).to include("Rd4")
      end
    end

    context "when the moves is to the east direction" do
      it "calculates the east possible positions" do
        expect(rook.possible_moves("Rd5")).to include("Rf5")
      end
    end

    context "when the moves is to the west direction" do
      it "calculates the west possible positions" do
        expect(rook.possible_moves("Rd5")).to include("Rb5")
      end
    end

  end

  describe '#valid_move?' do

    context "when is a valid move?" do

      context "when the move is to the north direction" do
        it "validates the north move" do
          expect(rook.valid_move?("Rd5","Rd7")).to eq(true)
        end
      end

      context "when the move is to the south direction" do
        it "validates the south move" do
          expect(rook.valid_move?("Rd5","Rd4")).to eq(true)
        end
      end

      context "when the move is to the west direction" do
        it "validates the west move" do
          expect(rook.valid_move?("Rd5","Rb5")).to eq(true)
        end
      end

      context "when the move is to the east direction" do
        it "validates the est move" do
          expect(rook.valid_move?("Rd5","Re5")).to eq(true)
        end
      end

    end

    context "when is an invalid move" do

      context "when is an invalid to the north direction" do
        it "invalidates the north move" do
          expect(rook.valid_move?("Rd5","Re6")).to eq(false)
        end
      end

      context "when is an invalid to the sourh direction" do
        it "invalidates the south move" do
          expect(rook.valid_move?("Rd5","Re4")).to eq(false)
        end
      end

      context "when is an invalid to the west direction" do
        it "invalidates the west move" do
          expect(rook.valid_move?("Rd5","Rc4")).to eq(false)
        end
      end

      context "when is an invalid to the east direction" do
        it "invalidates the east move" do
          expect(rook.valid_move?("Rd5","Re6")).to eq(false)
        end
      end

    end

  end

end
