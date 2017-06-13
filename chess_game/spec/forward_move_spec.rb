require "./lib/forward_move"

describe "ForwardMove" do

  let(:directions) {
    {:N => [:NORTH],:S => [:SOUTH]}
  }
  let(:move) {ForwardMove.new}
  let(:from) {"a2"}
  let(:positions) {["a8","a7","a6","a5","a4","a3","a1"]}

  describe '#new' do
    it "creates a new instance of ForwardMove class" do
      expect(ForwardMove.new).to be_instance_of(ForwardMove)
    end
  end

  describe '#possible_positions' do
    it "generates the possible positions from origin position" do
      expect(move.possible_positions(from)).to eq(positions)
    end
  end

end
