require "./lib/knight_new"

describe "Knight_New" do

  let(:piece) {Knight_New.new(:white,"b1")}

  let(:moves){["a3","c3","d2"]}

  describe '#new' do
    it "creates a new instance of Knight_New class" do
      expect(Knight_New.new(:white,"b1")). to be_instance_of(Knight_New)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves to the knight piece" do
      expect(piece.possible_moves).to eq(moves)
    end
  end


end
