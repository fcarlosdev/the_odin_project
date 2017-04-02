require './queen.rb'

describe "Queen" do

  let(:queen) {Queen.new("white",:queen,"\u2655")}

  describe '#new' do
    it "creates a new intance of the Queen piece" do
      expect(queen).to be_instance_of(Queen)
      expect(queen.color).to eq("white")
      expect(queen.type).to eq(:queen)
      expect(queen.image).to eq("♕")
    end
  end

  describe '#possible_moves' do
    it "calculates the possible moves from given initial positon" do
      expect(queen.possible_moves("Qd1")).to_not be_nil
      expect(queen.possible_moves("Qd1")).to include("Qd2")
    end
  end

  describe '#valid_move?' do

    context "when is a valid move?" do
      it "validates the move" do
        expect(queen.valid_move?("Qd1","Qd2")).to eq(true)
        expect(queen.valid_move?("Qd1","Qe2")).to eq(true)
      end
    end

    context "when is an invalid move" do
      it "invalidates the move" do
        expect(queen.valid_move?("Qd1","Qi1")).to eq(false)
      end
    end

  end

end
