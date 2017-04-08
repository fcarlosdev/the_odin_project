require "./king.rb"

describe "King" do

  let(:piece) {King.new("white",:king)}

  describe '#new' do
    it "creates a new instance of king piece" do
      expect(piece).to be_instance_of(King)
      expect(piece.color).to eq("white")
      expect(piece.type).to eq(:king)
      expect(piece.image).to eq("♔")
    end
  end

  describe '#possible_moves' do
    it "calculates the possible moves from given initial positon" do
      expect(piece.possible_moves("Ke1")).to_not be_nil
      expect(piece.possible_moves("Ke1")).to include("Ke2")
    end
  end

  describe '#valid_move?' do

    context "when is a valid move?" do
      it "validates the move" do
        expect(piece.valid_move?("Ke1","Ke2")).to eq(true)
        expect(piece.valid_move?("Ke1","Kf1")).to eq(true)
      end
    end

    context "when is an invalid move" do
      it "invalidates the move" do
        expect(piece.valid_move?("Ke1","Ke3")).to eq(false)
        expect(piece.valid_move?("Ke1","Ke9")).to eq(false)
        expect(piece.valid_move?("Ke1","Be9")).to eq(false)
      end
    end

  end

end
