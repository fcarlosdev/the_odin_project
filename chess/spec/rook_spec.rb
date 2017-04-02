require "./rook.rb"

describe "Rook" do

  let(:rook) {Rook.new("white",:rook,"\u2656")}

  describe '#new' do
    it "creates new instance of the rook piece" do
      expect(rook).to be_instance_of(Rook)
      expect(rook.color).to eq("white")
      expect(rook.type).to eq(:rook)
      expect(rook.image).to eq("♖")
    end
  end

  describe '#possible_moves' do
    it "calculates the possible moves from given initial positon" do
      expect(rook.possible_moves("Ra1")).to_not be_nil
      expect(rook.possible_moves("Ra1")).to include("Ra2")
      expect(rook.possible_moves("Ra1")).to include("Ra4")
    end
  end

  describe '#valid_move?' do

    context "when is a valid move?" do
      it "validates the move" do
        expect(rook.valid_move?("Ra1","Ra2")).to eq(true)
        expect(rook.valid_move?("Ra1","Rb1")).to eq(true)
        expect(rook.valid_move?("Ra1","Ra6")).to eq(true)
        expect(rook.valid_move?("Ra1","Rd1")).to eq(true)
      end
    end

    context "when is an invalid move" do
      it "invalidates the move" do
        expect(rook.valid_move?("Ra1","Rb2")).to eq(false)
      end
    end

  end

end
