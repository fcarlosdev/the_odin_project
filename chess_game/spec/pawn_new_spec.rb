require "pawn"
require "board_new"
require "./lib/forward_move"
require "./lib/diagonal_move"


describe "Pawn_New" do

  let(:board) {Board_New.new}
  let(:positions) {{b2: "b2", b3: "b3", b4: "b4", b6: "b6",
                    b5: "b5", b7: "b7", c2: "c2", c3: "c3",
                    c4: "c4", d3: "d3", d4: "d4"}}
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

  describe '#move' do

    context "when forward move" do

      context "when is a possible move" do
        it "moves the piece to the new position" do
          expect(pieces[:white_pawn].move(positions[:b3],board)).to eq(true)
          expect(board.value_from("b3")).to eq(pieces[:white_pawn])
        end
      end

      context "when move two positions at first move" do
        it "moves the piece to the new position" do
          expect(pieces[:white_pawn].move(positions[:b4],board)).to eq(true)
        end
      end

      context "when move two positions and no first move" do
        it "doesn't moves the piece to the new position" do
          pieces[:white_pawn].increment_moves
          expect(pieces[:white_pawn].move(positions[:b4],board)).to eq(false)
        end
      end

      context "when is an impossible move" do
        it "doesn't moves the piece to the new position" do
          expect(pieces[:white_pawn].move(positions[:c2],board)).to eq(false)
        end
      end

      context "when there is a piece at the end position" do
        it "doesn't moves the piece to the new position" do
          board.fill_square(positions[:b3],pieces[:black_pawn])
          expect(pieces[:white_pawn].move(positions[:b3],board)).to eq(false)
        end
      end

    end

    context "when is a capture move" do

      context "when is a possible capture move" do
        it "allows the piece to make the capture move" do
          board.fill_square(positions[:c3],pieces[:black_pawn])
          expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(true)
          expect(board.value_from(:c3)).to eq(pieces[:white_pawn])
        end
      end

      context "when is a possible capture move to a position with an ally piece" do
        it "doesn't allows that the capture move to be made" do
          board.fill_square(positions[:c3],pieces[:white_pawn_2])
          expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(false)
        end
      end

      context "when is a possible capture move to an empty position" do
        it "doesn't allows that the capture move to be made" do
          expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(false)
        end
      end

      context "when try to make a capture move moving more than one position" do
        it "doesn't allows that the capture move to be made" do
          expect(pieces[:white_pawn].move(positions[:d4],board)).to eq(false)
        end
      end

      context "when is an invalid capture position" do
        it "doesn't allows that the capture move to be made" do
          expect(pieces[:white_pawn].move(positions[:d3],board)).to eq(false)
        end
      end

    end

    context "when is an en passant move" do

      context "when is valid en passant move" do
        it "allows that the piece to make the move" do
          board.fill_square(positions[:c2],pieces[:black_pawn])
          expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(true)
          expect(board.value_from(positions[:c3])).to eq(pieces[:white_pawn])
          expect(board.value_from(positions[:c2])).to be_nil
        end
      end

    end

  end

end
