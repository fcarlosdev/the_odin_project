require "./lib/forward_move"

describe "ForwardMove" do

  let(:directions) {
    {:N => [:NORTH],:S => [:SOUTH]}
  }
  let(:move) {ForwardMove.new}
  let(:from) {"a2"}
  let(:positions) {
    [["a3"],
     ["a8","a7","a6","a5","a4","a3","a1"]]
  }

  describe '#new' do
    it "creates a new instance of ForwardMove class" do
      expect(ForwardMove.new).to be_instance_of(ForwardMove)
    end
  end

  describe '#get_positions' do

    context "when move by one position" do
      it "generates the new positon from the given parameters" do
        move_by = 1
        expect(move.get_positions(from,directions[:N],move_by)).to eq(positions[0])
      end
    end

    context "when move more than one positin" do
      it "generates the new positions from the given parameters" do
        move_by = 8
        expect(move.get_positions(from,directions[:N],move_by)).to eq(positions[1])
      end

    end

  end


end
