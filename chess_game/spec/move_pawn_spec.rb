require "./lib/move_pawn"
require "./lib/board_new"

describe "MovePawn" do

  let(:board) {Board_New.new}
  let(:move_pawn) {MovePawn.new(board)}
  let(:positions) {{b2: "b2", b3: "b3", b4: "b4", b6: "b6",
                    b5: "b5", b7: "b7", c2: "c2", c3: "c3",
                    c4: "c4", c5: "c5", d3: "d3", d4: "d4"}}
  let(:pieces) {
    {white_pawn: Pawn_New.new(:white,positions[:b2]),
     white_pawn_2: Pawn_New.new(:white,positions[:b3]),
     black_pawn: Pawn_New.new(:black,positions[:b7])}
  }


  describe '#new' do
    it "create a new instance of MovePawn class" do
      expect(MovePawn.new(board)).to be_instance_of(MovePawn)
    end
  end

  describe '#move' do

    context "when is a valid forward move" do
      it "moves the pawn piece to the new position" do
        expect(move_pawn.move(pieces[:white_pawn],positions[:b3])).to eq(true)
        expect(board.value_from(positions[:b3])).to eq(pieces[:white_pawn])
      end
    end
  end

end
