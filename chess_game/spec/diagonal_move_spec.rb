require "./lib/diagonal_move"

describe "DiagonalMove" do

  let(:diagonal) {DiagonalMove.new}

  describe '#new' do
    it "creates a new instance of DiagonalMove class" do
      expect(DiagonalMove.new).to be_instance_of(DiagonalMove)
    end
  end

  describe '#all_possible_moves' do
    it "generates all possible diagonal moves from one position" do
      expect(diagonal.all_possible_moves("d2",7)).to eq(["c1", "e3", "f4", "g5", "h6", "c3", "b4", "a5", "e1"])
    end
  end
end
