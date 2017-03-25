require './king.rb'

describe "King" do

  let(:king) {
    King.new({color:'black', image:"\u265A", type: :king, position: "Ke8"})
  }

  describe '#new' do
    it "Creates a new piece king" do
      expect(king).to be_instance_of(King)
      expect(king.color).to eql("black")
      expect(king.image).to eql("\u265A")
      expect(king.type).to eql(:king)
      expect(king.position).to eql("Ke8")
    end
  end

  describe '#move' do

    context "when is a valid move" do
      it "moves the king to the new position" do
        king.move("Ke8","Ke7")
        expect(king.position).to eq("Ke7")
      end

      context "when is an invalid move" do
        it "doesn't moves the kint to the new position" do
          king.move("Ke8","Km8")
          expect(king.position).to_not eq("Km8")
        end
      end

      context "when is a valid casting move" do
        it "moves the king two squares to the chosen direction" do
          king.move("Ke8","Kg8")
          expect(king.position).to eq("Kg8")
        end
      end

      context "when is an invalid casting move" do
        it "dosen't moves the king two squares to the chosen direction" do
          king.move("Ke8","Ke7")
          king.move("Ke8","Kg8")
          expect(king.position).to_not eq("Kg8")
        end
      end

    end

  end

  describe '#valid_move?' do

    context "when is a valid_move" do
      it "allows the move" do
        expect(king.valid_move?("Ke8","Ke7")).to eq(true)
      end
    end

    context "when is an invalid move" do

      context "when try to move the king to inexistent file" do
        it "doesn't allows the move" do
          expect(king.valid_move?("Ke8","Km7")).to eq(false)
        end
      end

      context "when try to move the king to inexistent rank" do
        it "doesn't allows the move" do
          expect(king.valid_move?("Ke8","Ke9")).to eq(false)
        end
      end

      context "when try to move the king more than one square and not is castling" do
        it "doesn't allows the move" do
          expect(king.valid_move?("Ke8","Ke6")).to eq(false)
        end
      end

    end
  end

  describe '#possible_moves' do
    it "calculates positions to where the king can go" do
      positions = ["e7", "f8", "d8", "f7", "d7"]
      expect(king.possible_moves("Ke8")).to eq(positions)
    end
  end

end
