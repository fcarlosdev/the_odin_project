require "./lib/knight.rb"

describe "Knight" do

  let(:knight) {Knight.new("white",:knight)}

  describe '#new' do
    it "creates a new intance of the knight piece" do
      expect(knight).to be_instance_of(Knight)
      expect(knight.color).to eq("white")
      expect(knight.type).to eq(:knight)
      expect(knight.image).to eq("♘")
    end
  end

  describe '#possible_moves' do
    it "calculates the possible moves from given initial positon" do
      expect(knight.possible_moves("Nb1")).to_not be_nil
      expect(knight.possible_moves("Nb1")).to include("Na3")
      expect(knight.possible_moves("Nb1")).to include("Nc3")
    end
  end

  describe '#valid_move?' do

    context "when is a valid move?" do
      it "validates the move" do
        expect(knight.valid_move?("Nb1","Na3")).to eq(true)
        expect(knight.valid_move?("Nb1","Nc3")).to eq(true)
      end
    end

    context "when is an invalid move" do
      it "invalidates the move" do
        expect(knight.valid_move?("Nb1","Nd3")).to eq(false)
      end
    end

  end

end
