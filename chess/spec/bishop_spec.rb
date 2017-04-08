require './bishop.rb'

describe "Bishop" do

  let(:bishop) {Bishop.new("white",:bishop)}

  describe '#new' do
    it "creates a new intance of the bishop piece" do
      expect(bishop).to be_instance_of(Bishop)
      expect(bishop.color).to eq("white")
      expect(bishop.type).to eq(:bishop)
      expect(bishop.image).to eq("♗")
    end
  end

  describe '#possible_moves' do

    context "when is a move to the northwest direction" do
      it "calculates the possible northwest moves" do
        expect(bishop.possible_moves("Bd5")).to include("Bb7")
        expect(bishop.possible_moves("Bb3")).to include("Ba4")
      end
    end

    context "when is a move to the southeast direction" do
      it "calculates the possible southeast moves" do
        expect(bishop.possible_moves("Bd5")).to include("Bf3")
        expect(bishop.possible_moves("Bb3")).to include("Bc2")
      end
    end

    context "when is a move to the northeast direction" do
      it "calculates the possible northeast moves" do
        expect(bishop.possible_moves("Bd5")).to include("Bf7")
        expect(bishop.possible_moves("Bb3")).to include("Bd5")
      end
    end

    context "when is a move to the southwest direction" do
      it "calculates the possible southwest moves" do
        expect(bishop.possible_moves("Bd5")).to include("Bb3")
        expect(bishop.possible_moves("Bb3")).to include("Ba2")
      end
    end

  end

  describe '#valid_move?' do

    context "when is a valid move?" do

      context "when is a move to the northwest direction" do
        it "validates the northwest moves" do
          expect(bishop.valid_move?("Bd5","Bb7")).to eq(true)
          expect(bishop.valid_move?("Bb3","Ba4")).to eq(true)
        end
      end

      context "when is a move to the southeast direction" do
        it "validates the southeast move" do
          expect(bishop.valid_move?("Bd5","Bf3")).to eq(true)
          expect(bishop.valid_move?("Bb3","Bc2")).to eq(true)
        end
      end

      context "when is a move to the northeast direction" do
        it "validates the northeast move" do
          expect(bishop.valid_move?("Bd5","Bf7")).to eq(true)
          expect(bishop.valid_move?("Bb3","Bd5")).to eq(true)
        end
      end

      context "when is a move to the southwest direction" do
        it "validates the southwest move" do
          expect(bishop.valid_move?("Bd5","Bb3")).to eq(true)
          expect(bishop.valid_move?("Bb3","Ba2")).to eq(true)
        end
      end

    end

    context "when is an invalid move" do

      context "when is an invalid move to the northwest direction" do
        it "invalidates the northwest moves" do
          expect(bishop.valid_move?("Bd5","Bb6")).to eq(false)
        end
      end

      context "when is an invalid move to the southeast direction" do
        it "invalidates the southeast move" do
          expect(bishop.valid_move?("Bd5","Bf4")).to eq(false)
        end
      end

      context "when is a move to the northeast direction" do
        it "validates the northeast move" do
          expect(bishop.valid_move?("Bd5","Bf7")).to eq(true)
        end
      end

      context "when is a move to the southwest direction" do
        it "validates the southwest move" do
          expect(bishop.valid_move?("Bd5","Bb3")).to eq(true)
        end
      end

    end

  end

end
