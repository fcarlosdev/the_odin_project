require "./lib/diagonal_move"

describe "DiagonalMove" do

  let(:move) {DiagonalMove.new}
  let(:from) {"b2"}
  let(:positions) {
    [["c3"],
     ["a3","c1","a1","c3","d4","e5","f6","g7","h8"]]
  }
  let(:directions) {
    {:NORTHEAST => [:NE], :NORTHWEST => [:NW],
     :SOUTHEAST => [:SE], :SOUTHWEST => [:SW]}
   }

  describe '#new' do
    it "create a new instance of DiagonalMove class" do
      expect(DiagonalMove.new).to be_instance_of(DiagonalMove)
    end
  end

  describe '#diagonal_positions' do

    context "when move by one position" do
      it "generates the new diagonal positon from the given parameters" do
        move_by = 1
        expect(move.diagonal_positions(from,directions[:NORTHEAST],move_by)).to eq(positions[0])
      end
    end

    context "when move more than one positin" do
      it "generates the new positions from the given parameters" do
        move_by = 4
        expect(move.diagonal_positions(from,directions[:NORTHEAST],move_by)).to eq(positions[1])
      end
    end

  end

end
