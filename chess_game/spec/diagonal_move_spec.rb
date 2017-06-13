require "./lib/diagonal_move"

describe "DiagonalMove" do

  let(:move) {DiagonalMove.new}
  let(:from) {"b2"}
  let(:positions) {["a3","c1","a1","c3","d4","e5","f6","g7","h8"]}

  describe '#new' do
    it "create a new instance of DiagonalMove class" do
      expect(DiagonalMove.new).to be_instance_of(DiagonalMove)
    end
  end

  describe '#possible_positions' do
    it "generates the possible positions from origin position" do
      expect(move.possible_positions(from)).to eq(positions)
    end
  end

end
