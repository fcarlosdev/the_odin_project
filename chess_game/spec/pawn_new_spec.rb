require "pawn"
require "board_new"
require "./lib/forward_move"
require "./lib/diagonal_move"


describe "Pawn_New" do

  let(:board) {Board_New.new}
  let(:positions) {{b2: "b2", b3: "b3", b4: "b4", b6: "b6",
                    b5: "b5", b7: "b7", c2: "c2", c3: "c3",
                    c4: "c4", c5: "c5", d3: "d3", d4: "d4"}}
  let(:pieces) {
    {white_pawn: Pawn_New.new(:white,positions[:b2]),
     white_pawn_2: Pawn_New.new(:white,positions[:b3]),
     black_pawn: Pawn_New.new(:black,positions[:b7])}
  }

  describe '#new' do
    it "creates a new instance of Pawn class" do
      expect(Pawn_New.new(:white,positions[:b2])).to be_instance_of(Pawn_New)
    end
  end

end
